Feature: Liquidation cigar samplers filtering basic

  Scenario Outline: Check filters
    When I open 'liquidation_cigar_samplers' page
    And search items by random '<filter_type>' filter on 'liquidation_cigar_samplers' page
    Then I should see correctly filtered items on 'liquidation_cigar_samplers' page through 'liquidation_cigar_samplers' api

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