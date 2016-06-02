Feature: Single cigars filtering basic

  Scenario Outline: Check filters
    When I open 'single_cigars' page
    And search items by random '<filter_type>' filter on 'single_cigars' page
    Then I should see correctly filtered items on 'single_cigars' page through 'single_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Country        |
      | Strength       |
      | Shape          |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |