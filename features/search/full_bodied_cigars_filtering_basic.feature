Feature: Full bodied cigars filtering basic

  Scenario Outline: Check filters
    When I open 'full_bodied_cigars' page
    And search items by random '<filter_type>' filter on 'full_bodied_cigars' page
    Then I should see correctly filtered items on 'full_bodied_cigars' page through 'full_bodied_cigars' api

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

  Scenario: PRICE filter