Feature: Cigar gifts filtering basic

  Scenario Outline: Check filters
    When I open 'cigar_gifts' page
    And search items by random '<filter_type>' filter on 'cigar_gifts' page
    Then I should see correctly filtered items on 'cigar_gifts' page through 'cigar_gifts' api

    Examples:
    | filter_type |
    | Promo       |
    | Brand       |

  Scenario: PRICE filter