class UpdatePasswordPage < WebPage
  include HeaderSection

  validate :url, pattern: /\/update-password\/[\w@]+$/
  validate :title, pattern: /^Update Password \| Famous Smoke$/

  add_locator :password_field,   '#updatepasswordform [name=pwd]'
  add_locator :retype_password_field, '#updatepasswordform [name=pwd2]'
  add_locator :submit_button, '#updatepasswordform .forgotten'
  add_locator :error_messages, '.logpage h3'

  def error_messages
    all(locator :error_messages).map { |e| e.text.strip }
  end

  def fill_form(fields)
    log.info "Fill Update Password form with following data: #{fields}"
    find(locator :password_field).set(fields[:password]) if fields[:password]
    find(locator :retype_password_field).set(fields[:retype_password]) if fields[:retype_password]
    self
  end

  def submit_form
    log.info 'Submit Update Password form'
    find(locator :submit_button).click
  end
end