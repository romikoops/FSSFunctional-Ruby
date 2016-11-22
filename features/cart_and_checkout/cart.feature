Feature: Cart

  Background:
    Given I am logged on famous-smoke.com

  Scenario: User can buy gift cards
    When I go to 'gifts' search page
    And I add the first listed item to my cart
    And I go to my cart
    Then Item should be in my cart

  Scenario: User can buy gift sets
    When I go to 'gifts' search page
    And I add to cart first available gift set
    And I go to my cart
    Then Item should be in my cart

  Scenario: User can buy Miscellaneous Cigar Accessories
    When I go to 'gifts' search page
    And I add to cart first available Accessories
    And I go to my cart
    Then Item should be in my cart

  Scenario: User can move items to favorites
    When I go to 'gifts' search page
    And I add the first listed item to my cart
    And I go to my cart
    And I move item to favorites
    Then I Shopping Cart should be empty

  Scenario: Price is recalculating if quantity changed
    When I go to 'gifts' search page
    And I add the first listed item to my cart
    And I go to my cart
    And I change item quantity to '3'
    Then I see that price is recalculated

  Scenario: User cannot use invalid promo code
    When I go to 'gifts' search page
    And I add the first listed item to my cart
    And I go to my cart
    And I use invalid promo code
    Then I see warning that promo code is invalid

  Scenario: User can preorder items
    When I go to 'gifts' search page
    And I preorder cigars item
    And I go to my cart
    Then Item should be in my cart

  Scenario: User can buy "free shipping" items
    When I go to 'gifts' search page
    And I add free shipping item to the cart
    And I go to my cart
    Then Item should be in my cart

  Scenario: User can choose offers in coupons list
    When I go to 'gifts' search page
    And I buy one of listed offers
    And I go to my cart
    Then Item should be in my cart

  Scenario: User can receive free items
    When I go to 'gifts' search page
    And I add item with free stuff
    And I go to my cart
    Then I see free item in my cart

#  Scenario: Free items quantity recalculate automatically
#    When I go to 'coupons' segment
#    And I add item with free stuff
#    And I go to my cart
#    And I change first item quantity to '3'
#    Then I see free item in my cart

  Scenario: User cannot proceed with checkout if the cart is empty
    When I go directly to my cart
    And I see that my cart is empty
    Then I cannot proceed with checkout

