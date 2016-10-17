Feature: Cart and Checkout
  In order to use shop
  As user
  I want to add items to the cart from random sale pages, remove items from cart, add promotion/coupon, remove promotion/coupon, and place orders

  Scenario: Add items to cart
    When I open random 'product' page in 'cigar-search' filter set
    And I add to cart item on opened 'product' page
    Then I should see item is added to cart text
    When I open random 'product' page in 'cigar-search' filter set
    And I add to cart item on opened 'product' page
    Then I should see item is added to cart text
    When I open my cart
    #And I open cigar coupon page
    #And I add random coupon to cart
    Then I should see selected items on 'cart' page
