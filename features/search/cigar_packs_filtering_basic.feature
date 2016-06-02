Feature: Cigar packs filtering basic

  Scenario Outline: Check filters
    When I open 'cigar_packs' page
    And search items by random '<filter_type>' filter on 'cigar_packs' page
    Then I should see correctly filtered items on 'cigar_packs' page through 'cigar_packs' api

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