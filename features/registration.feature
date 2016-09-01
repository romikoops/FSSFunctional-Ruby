Feature: Registration
  In order to use shop
  As user
  I want to register and access the system

  Scenario: register with valid credentials
    When I open 'registration' page
    And fill form with the following data on 'registration' page:
      | country         | FACTORY_USER[:country]         |
      | first_name      | FACTORY_USER[:first_name]      |
      | last_name       | FACTORY_USER[:last_name]       |
      | company         | FACTORY_USER[:company]         |
      | address1        | FACTORY_USER[:address1]        |
      | address2        | FACTORY_USER[:address2]        |
      | city            | FACTORY_USER[:city]            |
      | region          | FACTORY_USER[:region]          |
      | zip             | FACTORY_USER[:zip]             |
      | phone_number    | FACTORY_USER[:phone_number]    |
      | cell_number     | FACTORY_USER[:cell_number]     |
      | email           | FACTORY_USER[:email]           |
      | password        | FACTORY_USER[:password]        |
      | retype_password | FACTORY_USER[:retype_password] |
      | date_of_birth   | FACTORY_USER[:date_of_birth]   |
      | terms           | FACTORY_USER[:terms]           |
    And submit form on 'registration' page
    Then I should be on 'successful_registration' page

  Scenario: register with blank form
    When I open 'registration' page
    And submit form on 'registration' page
    Then I should be on 'registration' page