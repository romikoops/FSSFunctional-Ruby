Feature: Mexican cigars filtering basic

  Scenario Outline: Check filters
    When I open 'mexican_cigars' page
    And search items by random '<filter_type>' filter on 'mexican_cigars' page
    Then I should see correctly filtered items on 'mexican_cigars' page through 'mexican_cigars' api

    Examples:
      | filter_type    |
      | Brand          |
      | Strength       |
      | Package Type   |
      | Shape          |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Tube           |