class RegistrationPage < WebPage
  include HeaderSection
  include EmailModalBlockerSection

  url '/register'

  validate :url, pattern: /\/register$/
  validate :title, pattern: /^Create An Account \| Famous Smoke$/

  add_locator :email_field,           '.register_form [name=email]'
  add_locator :password_field,        '.register_form [name=passw]'
  add_locator :retype_password_field, '.register_form [name=passw2]'
  add_locator :country_select,        '.register_form [name=country]'
  add_locator :first_name_field,      '.register_form [name=fname]'
  add_locator :last_name_field,       '.register_form [name=lname]'
  add_locator :address1_field,        '.register_form [name=adr1]'
  add_locator :address2_field,        '.register_form [name=adr2]'
  add_locator :city_field,            '.register_form [name=city]'
  add_locator :state_select,          '.register_form [name=state]'
  add_locator :zip_field,             '.register_form [name=zip]'
  add_locator :phone_field,           '.register_form [name=phone]'
  add_locator :month_of_birth_select, '.register_form [name=dobm]'
  add_locator :day_of_birth_select,   '.register_form [name=dobd]'
  add_locator :year_of_birth_select,  '.register_form [name=doby]'
  add_locator :terms_checkbox,        '.register_form [name=terms]'
  add_locator :register_button,       '.register_form button.submitter'

  def self.register_user(user)
    open.close_email_modal_blocker.fill_form(user.attributes).submit_form
  end

  def fill_form(fields)
    log.info "Fill Registration form with following data: #{fields}"
    find(locator :email_field).set(fields[:email]) if fields[:email]
    find(locator :password_field).set(fields[:password]) if fields[:password]
    find(locator :retype_password_field).set(fields[:retype_password]) if fields[:retype_password]
    fill_select_box(:country_select, fields[:country]) if fields[:country]
    find(locator :first_name_field).set(fields[:first_name]) if fields[:first_name]
    find(locator :last_name_field).set(fields[:last_name]) if fields[:first_name]
    find(locator :address1_field).set(fields[:address1]) if fields[:address1]
    find(locator :address2_field).set(fields[:address2]) if fields[:address2]
    find(locator :city_field).set(fields[:city]) if fields[:city]
    fill_select_box(:state_select, fields[:state]) if fields[:state]
    find(locator :zip_field).set(fields[:zip]) if fields[:zip]
    find(locator :phone_field).set(fields[:phone]) if fields[:phone]
    fill_date_of_birth(fields[:date_of_birth]) if fields[:date_of_birth]
    find(locator :terms_checkbox).set(fields[:terms].present?)
    self
  end

  def fill_date_of_birth(date_of_birth)
    date = Time.parse(date_of_birth.to_s)

    fill_select_box(:month_of_birth_select, date.month)
    fill_select_box(:day_of_birth_select, date.day)
    fill_select_box(:year_of_birth_select, date.year)
  end

  def submit_form
    log.info 'Submit Registration form'
    find(locator :register_button).click
  end

  private
  def fill_select_box(locator_label, value)
    find(locator locator_label).find("[value='#{value}']").select_option
  end
end