Feature: Cigar tins filtering basic

  Scenario Outline: Check filters
    When I open 'cigar_tins' page
    And search items by random '<filter_type>' filter on 'cigar_tins' page
    Then I should see correctly filtered items on 'cigar_tins' page through 'cigar_tins' api

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