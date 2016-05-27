Feature: Cigar search filtering basic

  Scenario Outline: Check filters
    When I open 'cigar_search' page
    And search items by random '<filter_type>' filter on 'cigar_search' page
    Then I should see correctly filtered items on 'cigar_search' page through 'cigar_search' api

    Examples:
    | filter_type    |
    | Promo          |
    | Brand          |
    | Type           |
    | Country        |
    | Strength       |
    | Package Type   |
    | Shape          |
    | Wrapper Leaf   |
    | Color          |
    | Wrapper Origin |
    | Flavor         |
    | Tube           |


  Scenario: KEYWORD filter
  Scenario: QUANTITY filter
  Scenario: RING GAUGE filter
  Scenario: LENGTH filter
  Scenario: PRICE filter
  Scenario: RATING filter