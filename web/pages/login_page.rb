class LoginPage < Howitzer::Web::Page
  path '/login'

  validate :title, /^Login \| Famous Smoke$/

  section :header
  section :email_modal_blocker

  element :new_user_radiobutton, '#loginform #newreg'
  element :existing_user_radiobutton, '#loginform #exist'

  element :email_field, '#loginform [name=uname]'
  element :password_field, '#loginform [name=pwd]'
  element :submit_button, '#login-submit'

  element :existing_password,     :xpath,  "//*[@class='notnew']"
  element :existing_username,     :xpath,  "//input[@placeholder='enter your email address']"
  element :proceed_with_checkout  :xpath,  "//input[@value='Proceed to Checkout']"
  element :first_name,            '#to_fname1'
  element :last_name,             '#to_lname1'
  element :gift_note,             '#giftnote1'

  def fill_form(fields) # rubocop:disable Metrics/AbcSize
    Howitzer::Log.info "Fill Login form with following data: #{fields}"
    email_field_element.set(fields[:email]) if fields[:email]
    password_field_element.set(fields[:password]) if fields[:password]
    existing_user_radiobutton_element.click if fields[:existing_user]
    new_user_radiobutton_element.click if fields[:new_user]
    self
  end

  def submit_form
    Howitzer::Log.info 'Submit Login form'
    submit_button_element.click
  end

  def login_as_existing_user(login, pass)
    existing_username_element.set(login)
    existing_password_element.set(pass)
    submit_button_element.click
    fill_gift_form
  end

  def fill_gift_form
    first_name_element.set('Drew')
    last_name_element.set('Brocker')
    gift_note.set('congrats')
    proceed_with_checkout_element.click
  end
end
