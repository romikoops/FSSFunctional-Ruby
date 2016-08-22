module EmailModalBlockerSection
  def self.included(base)
    base.class_eval do
      add_locator :close_modal_button, '.emailmodalblocker a.closebutton'
    end
  end

  def close_email_modal_blocker
    settings.tries_small.times do
      sleep settings.timeout_tiny
      if first(locator :close_modal_button)
        find(locator :close_modal_button).click
        break
      end
    end
    self
  end
end