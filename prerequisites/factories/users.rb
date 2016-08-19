FactoryGirl.define do
  factory :user do
    ident           { Time.now.utc.to_i.to_s(16) }
    title           { User::TITLES.sample }
    first_name      { Faker::Name.first_name }
    last_name       { Faker::Name.last_name }
    company         { Faker::Company.name }
    address1        { Faker::Address.street_address }
    address2        { Faker::Address.secondary_address }
    city            { Faker::Address.city }
    state           { User::STATES.sample }
    zip             { Faker::Number.number(5) }
    home_phone      { [3, 3, 4].map { |n| Faker::Number.number(n) }.join('-') }
    business_phone  { [3, 3, 4].map { |n| Faker::Number.number(n) }.join('-') }
    email           { "u#{ident}@#{settings.mailgun_domain}" }
    retype_email    { email }
    password        { settings.def_test_pass }
    retype_password { password }
    date_of_birth   { (21..70).to_a.sample.years.ago }
    announcements   { true }
  end
end