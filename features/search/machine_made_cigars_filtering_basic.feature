Feature: Machine made cigars filtering basic

  Scenario Outline: Check filters
    When I open 'machine_made_cigars' page
    And search items by random '<filter_type>' filter on 'machine_made_cigars' page
    Then I should see correctly filtered items on 'machine_made_cigars' page through 'machine_made_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Brand          |
      | Country        |
      | Strength       |
      | Package Type   |
      | Shape          |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |