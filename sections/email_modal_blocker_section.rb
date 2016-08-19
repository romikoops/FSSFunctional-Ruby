module EmailModalBlockerSection
  def self.included(base)
    base.class_eval do
      add_locator :close_modal_button, '.emailmodalblocker a.closebutton'
    end
  end

  def close_email_modal_blocker
    settings.tries_small.times do
      sleep settings.timeout_tiny
      find(locator :close_modal_button).click if first(locator :close_modal_button)
    end
    self
  end
end