class ResetPasswordPage < WebPage
  include HeaderSection
  include EmailModalBlockerSection

  url '/reset-password'

  validate :url, pattern: /\/reset-password$/
  validate :title, pattern: /^Reset Password \| Famous Smoke$/

  add_locator :email_field,   '#email'
  add_locator :submit_button, '.newbtn.forgotten'
  add_locator :error_messages, '.logpage h3'

  def error_messages
    all(locator :error_messages).map { |e| e.text.strip }
  end

  def fill_form(fields)
    log.info "Fill Reset Password form with following data: #{fields}"
    find(locator :email_field).set(fields[:email]) if fields[:email]
    self
  end

  def submit_form
    log.info 'Submit Reset Password form'
    find(locator :submit_button).click
  end
end