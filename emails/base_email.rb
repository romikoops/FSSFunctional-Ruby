class BaseEmail < Howitzer::Email
  class << self
    def add_anchor(anchor)
      @anchors ||= { self => [] }
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
