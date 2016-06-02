Feature: Small cigars filtering basic

  Scenario Outline: Check filters
    When I open 'small_cigars' page
    And search items by random '<filter_type>' filter on 'small_cigars' page
    Then I should see correctly filtered items on 'small_cigars' page through 'small_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Brand          |
      | Type           |
      | Country        |
      | Strength       |
      | Package Type   |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |