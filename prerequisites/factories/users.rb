FactoryGirl.define do
  factory :user do
    ident           { Time.now.utc.to_i.to_s(36) }
    country         { 'USA' }
    first_name      { Faker::Name.first_name }
    last_name       { Faker::Name.last_name }
    company         { Faker::Company.name }
    address1        { Faker::Address.street_address }
    address2        { Faker::Address.secondary_address }
    city            { Faker::Address.city }
    state           do
      %w(AA AE AK AL AP AR AS AZ CA CO CT DC DE FL FM GA GU HI IA ID IL IN KS KY LA MA MD ME MH MI MN
         MO MP MS MT NC ND NE NH NJ NM NV NY OH OK OR PA PR PW RI SC SD TN TX UT VA VI VT WA WI WV WY).sample
    end
    zip             { Faker::Number.number(5) }
    phone_number    { Faker::Number.number(10).to_s }
    cell_number     { Faker::Number.number(10).to_s }
    email           { "u#{ident}@#{Howitzer.mailgun_domain}" }
    password        { Howitzer.app_test_pass }
    retype_password { password }
    date_of_birth   { (22..70).to_a.sample.years.ago.strftime('%m/%d/%Y') }
    terms           { true }

    trait :default do
      initialize_with { User.default || User.new }
    end
  end
end
