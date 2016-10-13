class RegistrationPage < Howitzer::Web::Page
  path '/register'

  validate :url, /\/register$/
  validate :title, /^Create An Account \| Famous Smoke$/

  section :header
  section :email_modal_blocker

  element :email_field,           '.register_form [name=email]'
  element :password_field,        '.register_form [name=pass_confirmation]'
  element :retype_password_field, '.register_form [name=pass]'
  element :country_select,        '.register_form [name=country]'
  element :first_name_field,      '.register_form [name=fname]'
  element :last_name_field,       '.register_form [name=lname]'
  element :company_field,         '.register_form [name=company]'
  element :address1_field,        '.register_form [name=adr1]'
  element :address2_field,        '.register_form [name=adr2]'
  element :city_field,            '.register_form [name=city]'
  element :state_select,          '.register_form [name=state]'
  element :zip_field,             '.register_form [name=zip]'
  element :phone_number_field,    '.register_form [name=phone]'
  element :cell_number_field,     '.register_form [name=phone2]'
  element :email_field,           '.register_form [name=email]'
  element :password_field,        '.register_form [name=pass_confirmation]'
  element :retype_password_field, '.register_form [name=pass]'
  element :date_of_birth_field,   '.register_form [name=dob]'
  element :terms_checkbox,        '.register_form [for*="terms"] .fakecheck'
  element :register_button,       '.register_form button.submitter'
  element :registration_form,     '.register_form'

  def self.register_user(user)
    open.close_email_modal_blocker.fill_form(user.attributes).submit_form

    # we need to comunicate with page to wait while form submitted before doing something
    unless instance.has_no_registration_form_element?
      raise "User can not be registered with the following fields: #{user.attributes}"
    end
  end

  def fill_form(fields)
    log.info "Fill Registration form with following data: #{fields}"
    fill_select_box(country_select_element, fields[:country]) if fields[:country]
    first_name_field_element.set(fields[:first_name]) if fields[:first_name]
    last_name_field_element.set(fields[:last_name]) if fields[:last_name]
    company_field_element.set(fields[:company]) if fields[:company]
    address1_field_element.set(fields[:address1]) if fields[:address1]
    address2_field_element.set(fields[:address2]) if fields[:address2]
    city_field_element.set(fields[:city]) if fields[:city]
    fill_select_box(state_select_element, fields[:state]) if fields[:state]
    zip_field_element.set(fields[:zip]) if fields[:zip]
    phone_number_field_element.set(fields[:phone_number]) if fields[:phone_number]
    cell_number_field_element.set(fields[:cell_number]) if fields[:cell_number]
    email_field_element.set(fields[:email]) if fields[:email]
    password_field_element.set(fields[:password]) if fields[:password]
    retype_password_field_element.set(fields[:retype_password]) if fields[:retype_password]
    date_of_birth_field_element.set(fields[:date_of_birth]) if fields[:date_of_birth]
    terms_checkbox_element.click if fields[:terms].present?
    self
  end

  def submit_form
    log.info 'Submit Registration form'
    register_button_element.click
  end

  private

  def fill_select_box(element, value)
    element.first("[value='#{value}']").select_option
  end
end
