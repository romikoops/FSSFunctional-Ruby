Feature: Cigarillos cigars filtering basic

  Scenario Outline: Check filters
    When I open 'cigarillos_cigars' page
    And search items by random '<filter_type>' filter on 'cigarillos_cigars' page
    Then I should see correctly filtered items on 'cigarillos_cigars' page through 'cigarillos_cigars' api

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