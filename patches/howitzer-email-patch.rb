class Email
  class << self
    def add_anchor(anchor)
      @anchors ||= {self => []}
      @anchors[self] << anchor
    end

    def anchors
      @anchors.is_a?(Hash) ? @anchors[self] : []
    end
  end

  def anchors
    self.class.anchors
  end

  def errors
    @errors ||= anchors.uniq.reject { |a| text[a] }.map(&:inspect)
  end

  def valid?
    log.warn "Email does not match to the following anchors:\n #{errors.join(", \n")}" if errors.present?
    errors.blank?
  end
end

module MailAdapters
  class Mailgun < Abstract
    def self.retrieve_message(recipient, subject)
      event = event_by(recipient, subject)
      fail ::Howitzer::EmailNotFoundError, 'Message not received yet, retry...' unless event
      message_url = event['storage']['url'].gsub(/^(https?:\/\/)(.*)$/, "\\1api:#{::Mailgun::Connector.instance.api_key}@\\2")
      JSON.parse(RestClient.get(message_url)) rescue nil
    end
    private_class_method :retrieve_message
  end
end
