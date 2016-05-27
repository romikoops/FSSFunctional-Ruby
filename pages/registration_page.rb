class RegistrationPage < WebPage
  include EmailModalBlockerSection

  url '/register'

  validate :url, pattern: /\/register$/
  validate :title, pattern: /^Create An Account | Famous Smoke$/

  add_locator :title_select,           '[name=sal]'
  add_locator :state_select,           '[name=st]'
  add_locator :month_of_birth_select,  '[name=dob_mo]'
  add_locator :day_of_birth_select,    '[name=dob_day]'
  add_locator :year_of_birth_select,   '[name=dob_yr]'
  add_locator :announcements_checkbox, '[name=ewkspec]'
  add_locator :register_button,        '#goButtonID'

  add_field_locator :first_name_field,        'fname'
  add_field_locator :last_name_field,         'lname'
  add_field_locator :company_field,           'company'
  add_field_locator :address1_field,          'adr1'
  add_field_locator :address2_field,          'adr2'
  add_field_locator :city_field,              'city'
  add_field_locator :zip_field,               'zip'
  add_field_locator :home_phone_ac_field,     'phnv1ac'
  add_field_locator :home_phone_ic_field,     'phnv1ic'
  add_field_locator :home_phone_ex_field,     'phnv1ex'
  add_field_locator :business_phone_ac_field, 'phnv2ac'
  add_field_locator :business_phone_ic_field, 'phnv2ic'
  add_field_locator :business_phone_ex_field, 'phnv2ex'
  add_field_locator :email_field,             'eadr'
  add_field_locator :retype_email_field,      'eadr2'
  add_field_locator :password_field,          'passw'
  add_field_locator :retype_password_field,   'passw2'

  def fill_fields(fields)
    fill_select_box(:title_select, fields[:title]) if fields[:title]
    fill_select_box(:state_select, fields[:state]) if fields[:state]

    fill_in(field_locator(:first_name_field), with: fields[:first_name]) if fields[:first_name]
    fill_in(field_locator(:last_name_field), with: fields[:last_name]) if fields[:first_name]
    fill_in(field_locator(:company_field), with: fields[:company]) if fields[:company]
    fill_in(field_locator(:address1_field), with: fields[:address1]) if fields[:address1]
    fill_in(field_locator(:address2_field), with: fields[:address2]) if fields[:address2]
    fill_in(field_locator(:city_field), with: fields[:city]) if fields[:city]
    fill_in(field_locator(:zip_field), with: fields[:zip]) if fields[:zip]
    fill_in(field_locator(:email_field), with: fields[:email]) if fields[:email]
    fill_in(field_locator(:retype_email_field), with: fields[:retype_email]) if fields[:retype_email]
    fill_in(field_locator(:password_field), with: fields[:password]) if fields[:password]
    fill_in(field_locator(:retype_password_field), with: fields[:retype_password]) if fields[:retype_password]

    fill_date_of_birth(fields[:date_of_birth]) if fields[:date_of_birth]
    fill_home_phone(fields[:home_phone]) if fields[:home_phone]
    fill_business_phone(fields[:business_phone]) if fields[:business_phone]

    find(locator :announcements_checkbox).set(fields[:announcements].present?)
  end

  def fill_date_of_birth(date_of_birth)
    date = Time.parse(date_of_birth)

    fill_select_box(:month_of_birth_select, date.strftime('%m'))
    fill_select_box(:day_of_birth_select, date.strftime('%d'))
    fill_select_box(:year_of_birth_select, date.strftime('%Y'))
  end

  def fill_home_phone(home_phone)
    ac, ic, ex = home_phone.scan(/(\d+)-(\d+)-(\d+)/).try :first

    fill_in(field_locator(:home_phone_ac_field), with: ac)
    fill_in(field_locator(:home_phone_ic_field), with: ic)
    fill_in(field_locator(:home_phone_ex_field), with: ex)
  end

  def fill_business_phone(business_phone)
    ac, ic, ex = business_phone.scan(/(\d+)-(\d+)-(\d+)/).try :first

    fill_in(field_locator(:business_phone_ac_field), with: ac)
    fill_in(field_locator(:business_phone_ic_field), with: ic)
    fill_in(field_locator(:business_phone_ex_field), with: ex)
  end

  def submit_form
    find(locator :register_button).click
  end

  private
  def fill_select_box(locator_label, value)
    find(locator locator_label).find("[value='#{value}']").select_option
  end
end