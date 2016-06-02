Feature: Top rated pairing cigar samplers filtering basic

  Scenario Outline: Check filters
    When I open 'top_rated_pairing_cigar_samplers' page
    And search items by random '<filter_type>' filter on 'top_rated_pairing_cigar_samplers' page
    Then I should see correctly filtered items on 'top_rated_pairing_cigar_samplers' page through 'top_rated_pairing_cigar_samplers' api

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