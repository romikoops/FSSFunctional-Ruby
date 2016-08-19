module EmailModalBlockerSection
  def self.included(base)
    base.class_eval do
      add_locator :close_modal_button, '.emailmodalblocker a.closebutton'
    end
  end

  def close_email_modal_blocker
    sleep 3
    find(locator :close_modal_button).click if first(locator :close_modal_button)
    self
  end
end