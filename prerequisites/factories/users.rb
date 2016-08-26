FactoryGirl.define do
  factory :user do
    ident           { Time.now.utc.to_i.to_s(36) }
    email           { "u#{ident}@#{settings.mailgun_domain}" }
    password        { settings.def_test_pass }
    retype_password { password }
    country         { User::COUNTRY }
    first_name      { Faker::Name.first_name }
    last_name       { Faker::Name.last_name }
    address1        { Faker::Address.street_address }
    address2        { Faker::Address.secondary_address }
    city            { Faker::Address.city }
    state           { User::STATES.sample }
    zip             { Faker::Number.number(5) }
    phone           { Faker::PhoneNumber.phone_number }
    date_of_birth   { (21..70).to_a.sample.years.ago }
    terms           { true }
  end
end