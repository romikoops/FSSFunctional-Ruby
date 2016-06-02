Feature: Bundle cigars filtering basic

  Scenario Outline: Check filters
    When I open 'bundle_cigars' page
    And search items by random '<filter_type>' filter on 'bundle_cigars' page
    Then I should see correctly filtered items on 'bundle_cigars' page through 'bundle_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Brand          |
      | Country        |
      | Strength       |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |