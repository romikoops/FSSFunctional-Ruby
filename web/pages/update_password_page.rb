class UpdatePasswordPage < Howitzer::Web::Page
  validate :url, /\/update-password\/[\w@]+$/
  validate :title, /^Update Password \| Famous Smoke$/

  section :header

  element :password_field, '#updatepasswordform [name=pwd]'
  element :retype_password_field, '#updatepasswordform [name=pwd2]'
  element :submit_button, '#updatepasswordform .forgotten'
  element :error_message, '.logpage h3'

  def error_messages
    error_message_elements.map { |e| e.text.strip }
  end

  def fill_form(fields)
    log.info "Fill Update Password form with following data: #{fields}"
    password_field_element.set(fields[:password]) if fields[:password]
    retype_password_field_element.set(fields[:retype_password]) if fields[:retype_password]
    self
  end

  def submit_form
    log.info 'Submit Update Password form'
    submit_button_element.click
  end
end
