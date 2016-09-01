FactoryGirl.define do
  factory :user do
    ident           { Time.now.utc.to_i.to_s(36) }

    country         { User::COUNTRIES.sample }
    first_name      { Faker::Name.first_name }
    last_name       { Faker::Name.last_name }
    company         { Faker::Company.name }
    address1        { Faker::Address.street_address }
    address2        { Faker::Address.secondary_address }
    city            { Faker::Address.city }
    region          { Faker::Address.state_abbr }
    zip             { Faker::Number.number(5) }
    phone_number    { Faker::PhoneNumber.phone_number }
    cell_number     { Faker::PhoneNumber.cell_phone }
    email           { "u#{ident}@#{settings.mailgun_domain}" }
    password        { settings.def_test_pass }
    retype_password { password }
    date_of_birth   { (22..70).to_a.sample.years.ago.strftime('%m/%d/%Y') }
    terms           { true }
  end
end