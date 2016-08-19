class LoginPage < WebPage
  include HeaderSection
  include EmailModalBlockerSection

  url '/login'

  validate :url, pattern: /\/login$/
  validate :title, pattern: /^Login \| Famous Smoke$/

  add_locator :new_user_radiobutton, '#loginform #newreg'
  add_locator :existing_user_radiobutton, '#loginform #exist'

  add_locator :email_field, '#loginform [name=uname]'
  add_locator :password_field, '#loginform [name=pwd]'
  add_locator :submit_button, '#login-submit'

  def fill_form(fields)
    log.info "Fill Login form with following data: #{fields}"
    find(locator :email_field).set(fields[:email]) if fields[:email]
    find(locator :password_field).set(fields[:password]) if fields[:password]
    find(locator :existing_user_radiobutton).click if fields[:existing_user]
    find(locator :new_user_radiobutton).click if fields[:new_user]
    self
  end

  def submit_form
    log.info 'Submit Login form'
    find(locator :submit_button).click
  end
end