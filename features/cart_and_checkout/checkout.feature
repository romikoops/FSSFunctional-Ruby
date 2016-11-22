Feature: Checkout

  Scenario: User can proceed with checkout using the test credit card
    Given registered FACTORY_USER user
    And I am logged on famous-smoke.com
    When I go to 'gifts' search page
    And I add the first listed item to my cart
    And I go to my cart
    And I proceed with checkout using the test credit card by FACTORY_USER user
    Then I see the order 'phone verification' page

  Scenario: User can preorder new cigars
    Given registered FACTORY_USER user
    And I am logged on famous-smoke.com
    When I go to 'cigars' search page
    And I preorder cigars item
    And I go to my cart
    And I proceed with checkout using the test credit card by FACTORY_USER user
    Then I see the order 'phone verification' page

  Scenario: User premium cigars using promo code
    Given registered FACTORY_USER user
    And I am logged on famous-smoke.com
    When I go to 'cigars' search page
    And I preorder premium cigars
    And I go to my cart
    And I change item quantity to '5'
    And I use 'CATSRULE' promo code
    Then New price is recalculated