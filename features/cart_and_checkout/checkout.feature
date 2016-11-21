Feature: Checkout

  Scenario: User can proceed with checkout using the test credit card
    Given registered FACTORY_USER user
    And I am logged on famous-smoke.com
    When I go to 'gifts' search page
    And I add the first listed item to my cart
    And I go to my cart
    And I proceed with checkout using the test credit card by FACTORY_USER user
    Then I see the order 'phone verification' page