Feature: Registration
  In order to use shop
  As user
  I want to register and access the system

  Scenario: register with valid credentials
    When I open 'registration' page
    And fill form with the following data on 'registration' page:
      | title           | FACTORY_USER[:title]           |
      | first_name      | FACTORY_USER[:first_name]      |
      | last_name       | FACTORY_USER[:last_name]       |
      | company         | FACTORY_USER[:company]         |
      | address1        | FACTORY_USER[:address1]        |
      | address2        | FACTORY_USER[:address2]        |
      | city            | FACTORY_USER[:city]            |
      | state           | FACTORY_USER[:state]           |
      | zip             | FACTORY_USER[:zip]             |
      | home_phone      | FACTORY_USER[:home_phone]      |
      | business_phone  | FACTORY_USER[:business_phone]  |
      | email           | FACTORY_USER[:email]           |
      | retype_email    | FACTORY_USER[:retype_email]    |
      | password        | FACTORY_USER[:password]        |
      | retype_password | FACTORY_USER[:retype_password] |
      | date_of_birth   | FACTORY_USER[:date_of_birth]   |
      | announcements   | FACTORY_USER[:announcements]   |
    And submit form on 'registration' page
    Then I should be on 'successful_registration' page

  Scenario: register with blank form
    When I open 'registration' page
    And submit form on 'registration' page
    Then I should be on 'registration' page