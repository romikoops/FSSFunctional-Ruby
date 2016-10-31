Feature: Checkout

  Scenario: User can proceed with checkout using pay-pal
    Given registered FACTORY_USER user
    And I am logged on famous-smoke.com
    When I go to 'gifts' segment
    And I add to cart first available gift card
    And I go to my cart
    And I proceed with checkout using pay-pal by FACTORY_USER user
    Then I see order 'phone verifecation' message
