Feature: Reset password
  In order to use Famous-smoke.com
  As user who cannot remember his credentials
  I want to reset password and access the system

  Scenario: User receives reset password email
    Given registered FACTORY_USER user
    When I fill and submit form with following data on 'reset_password' page:
      | email | FACTORY_USER[:email] |
    Then I should see that user 'FACTORY_USER' receive 'reset_password' email


  Scenario Outline: User can not reset password by invalid email
    When I fill and submit form with following data on 'reset_password' page:
      | email | <email> |
    Then I should see the following error messages on 'reset_password' page:
      | 1 | <error_message> |

    Examples:
      | email                  | error_message                                                                  |
      | _                      | Email invalid                                                                  |
      | e                      | Email invalid                                                                  |
      | ________@_____.___     | Email invalid                                                                  |
      | 11111111@11111.111     | Email invalid                                                                  |
      | e@a.l                  | Email invalid                                                                  |
      | email@emai.l           | Email invalid                                                                  |
      | aaaaaa@aaa.aaaa        | Email invalid                                                                  |
      | abcdefg@abcdefg@abc    | Email invalid                                                                  |
      | abcdefg@abcdefgaabc    | Email invalid                                                                  |
      | unregistered@email.com | Unable to reset your password. Please verify your email address and try again. |


  Scenario: User updates password and login with new password
    Given registered FACTORY_USER user
    When I fill and submit form with following data on 'reset_password' page:
      | email | FACTORY_USER[:email] |
    And open reset password link from received to 'FACTORY_USER' user 'reset_password' email
    And fill form with following data on 'update_password' page:
      | password        | NewPa55w0rc1 |
      | retype_password | NewPa55w0rc1 |
    And submit form on 'update_password' page
    And fill and submit form with following data on 'login' page:
      | email    | FACTORY_USER[:email] |
      | password | NewPa55w0rc1         |
    And open 'Billing Address' page from main drop down menu on 'landing' page
    Then I should be on 'billing_address' page
