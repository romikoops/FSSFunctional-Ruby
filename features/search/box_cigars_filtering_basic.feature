Feature: Box cigars filtering basic

  Scenario Outline: Check filters
    When I open 'box_cigars' page
    And search items by random '<filter_type>' filter on 'box_cigars' page
    Then I should see correctly filtered items on 'box_cigars' page through 'box_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Brand          |
      | Country        |
      | Strength       |
      | Shape          |
      | Color          |
      | Flavor         |
      | Tube           |