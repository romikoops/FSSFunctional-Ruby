Feature: Jar cigars filtering basic

  Scenario Outline: Check filters
    When I open 'jar_cigars' page
    And search items by random '<filter_type>' filter on 'jar_cigars' page
    Then I should see correctly filtered items on 'jar_cigars' page through 'jar_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Brand          |
      | Type           |
      | Country        |
      | Strength       |
      | Shape          |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |