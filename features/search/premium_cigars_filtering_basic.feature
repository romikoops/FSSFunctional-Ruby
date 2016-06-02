Feature: Premium cigars filtering basic

  Scenario Outline: Check filters
    When I open 'premium_cigars' page
    And search items by random '<filter_type>' filter on 'premium_cigars' page
    Then I should see correctly filtered items on 'premium_cigars' page through 'premium_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Country        |
      | Strength       |
      | Package Type   |
      | Shape          |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |