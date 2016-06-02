Feature: American cigars filtering basic

  Scenario Outline: Check filters
    When I open 'american_cigars' page
    And search items by random '<filter_type>' filter on 'american_cigars' page
    Then I should see correctly filtered items on 'american_cigars' page through 'american_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Brand          |
      | Strength       |
      | Package Type   |
      | Shape          |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |