Feature: Cart and Checkout
  In order to use shop
  As user
  I want to add items to the cart, remove items from cart, add promotions, remove promotions, and place orders

  @wip
  Scenario: Add item to cart on product page
    When I open random 'product' page in 'cigar-search' filter set
    And I add to cart item on opened 'product' page
    Then I should see selected items on 'cart' page

  @wip
  Scenario: Add item to cart
    When I open random '' page in 'cigar-search' filter set
    And I add to cart item on opened 'product' page
    Then I should see selected items on 'cart' page
