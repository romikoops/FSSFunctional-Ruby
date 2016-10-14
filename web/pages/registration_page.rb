class RegistrationPage < Howitzer::Web::Page
  path '/register'

  validate :url, %r{\/register$}
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

  def fill_form(fields) # rubocop:disable
    Howitzer::Log.info "Fill Registration form with following data: #{fields}"
    [
      :country, :first_name, :last_name, :company, :address1, :address2, :city, :state, :zip,
      :phone_number, :cell_number, :email, :password, :retype_password, :date_of_birth, :terms
    ].each { |field| send("fill_#{field}", fields) }
    self
  end

  def submit_form
    Howitzer::Log.info 'Submit Registration form'
    register_button_element.click
  end

  private

  def fill_country(fields)
    fill_select_box(country_select_element, fields[:country]) if fields[:country]
  end

  def fill_first_name(fields)
    first_name_field_element.set(fields[:first_name]) if fields[:first_name]
  end

  def fill_last_name(fields)
    last_name_field_element.set(fields[:last_name]) if fields[:last_name]
  end

  def fill_company(fields)
    company_field_element.set(fields[:company]) if fields[:company]
  end

  def fill_address1(fields)
    address1_field_element.set(fields[:address1]) if fields[:address1]
  end

  def fill_address2(fields)
    address2_field_element.set(fields[:address2]) if fields[:address2]
  end

  def fill_city(fields)
    city_field_element.set(fields[:city]) if fields[:city]
  end

  def fill_state(fields)
    fill_select_box(state_select_element, fields[:state]) if fields[:state]
  end

  def fill_zip(fields)
    zip_field_element.set(fields[:zip]) if fields[:zip]
  end

  def fill_phone_number(fields)
    phone_number_field_element.set(fields[:phone_number]) if fields[:phone_number]
  end

  def fill_cell_number(fields)
    cell_number_field_element.set(fields[:cell_number]) if fields[:cell_number]
  end

  def fill_email(fields)
    email_field_element.set(fields[:email]) if fields[:email]
  end

  def fill_password(fields)
    password_field_element.set(fields[:password]) if fields[:password]
  end

  def fill_retype_password(fields)
    retype_password_field_element.set(fields[:retype_password]) if fields[:retype_password]
  end

  def fill_date_of_birth(fields)
    date_of_birth_field_element.set(fields[:date_of_birth]) if fields[:date_of_birth]
  end

  def fill_terms(fields)
    terms_checkbox_element.click if fields[:terms].present?
  end

  def fill_select_box(element, value)
    element.first("[value='#{value}']").select_option
  end
end
