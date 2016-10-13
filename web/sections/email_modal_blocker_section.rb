class EmailModalBlockerSection < Howitzer::Web::Section
  me 'Specify me' # TODO

  element :close_modal_button, '.emailmodalblocker a.closebutton.trackEvent'

  def close_email_modal_blocker
    Howitzer.tries_small.times do
      sleep 1
      unless has_no_close_modal_button_element?
        close_modal_button_element.click
        break
      end
    end
    self
  end
end
