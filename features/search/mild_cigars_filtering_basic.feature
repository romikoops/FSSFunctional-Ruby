Feature: Mild cigars

  Scenario Outline: Check filters
    When I open 'mild_cigars' page
    And search items by random '<filter_type>' filter on 'mild_cigars' page
    Then I should see correctly filtered items on 'mild_cigars' page through 'mild_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Brand          |
      | Country        |
      | Package Type   |
      | Shape          |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |