Feature: Dominican cigars filtering basic

  Scenario Outline: Check filters
    When I open 'dominican_cigars' page
    And search items by random '<filter_type>' filter on 'dominican_cigars' page
    Then I should see correctly filtered items on 'dominican_cigars' page through 'dominican_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Brand          |
      | Strength       |
      | Shape          |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |