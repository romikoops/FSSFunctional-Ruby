Feature: Carton cigars filtering basic

  Scenario Outline: Check filters
    When I open 'carton_cigars' page
    And search items by random '<filter_type>' filter on 'carton_cigars' page
    Then I should see correctly filtered items on 'carton_cigars' page through 'carton_cigars' api

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