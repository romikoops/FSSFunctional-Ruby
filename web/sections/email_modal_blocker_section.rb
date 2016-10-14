class EmailModalBlockerSection < Howitzer::Web::Section
  me '.emailmodalblocker'

  element :close_modal_button, 'a.closebutton.trackEvent'

  def close
    close_modal_button_element.click
  end
end
