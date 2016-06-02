Feature: Honduran cigars filtering basic

  Scenario Outline: Check filters
    When I open 'honduran_cigars' page
    And search items by random '<filter_type>' filter on 'honduran_cigars' page
    Then I should see correctly filtered items on 'honduran_cigars' page through 'honduran_cigars' api

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