Feature: Cart and Checkout
  In order to use shop
  As user
  I want to add items to the cart from random sale pages, remove items from cart, add promotion/coupon, remove promotion/coupon, and place orders

  Background:
    Given I am logged on famous-smoke.com

  Scenario: User can buy gift cards
    When I go to 'gifts' segment
    And I add to cart first available gift card
    And I go to my cart
    Then Item should be in my cart

  Scenario: User can buy gift sets
    When I go to 'gifts' segment
    And I add to cart first available gift set
    And I go to my cart
    Then Item should be in my cart

  Scenario: User can buy Miscellaneous Cigar Accessories
    When I go to 'gifts' segment
    And I add to cart first available Accessories
    And I go to my cart
    Then Item should be in my cart

  Scenario: User can move items to favorites
    When I go to 'gifts' segment
    And I add to cart first available gift card
    And I go to my cart
    And I move item to favorites
    Then I Shopping Cart should be empty

  Scenario: Price is recalculating if quantity changed
    When I go to 'gifts' segment
    And I add to cart first available gift card
    And I go to my cart
    And I change item quantity to '3'
    Then I see that price is recalculated

  Scenario: User cannot use invalid promo code
    When I go to 'gifts' segment
    And I add to cart first available gift card
    And I go to my cart
    And I use invalid promo code
    Then I see warning that promo code is invalid

  Scenario: User can preorder items
    When I go to 'cigars' segment
    And I preorder cigars item
    And I go to my cart
    Then Item should be in my cart
