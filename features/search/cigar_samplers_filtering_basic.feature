Feature: Cigar samplers filtering basic

  Scenario Outline: Check filters
    When I open 'cigar_samplers' page
    And search items by random '<filter_type>' filter on 'cigar_samplers' page
    Then I should see correctly filtered items on 'cigar_samplers' page through 'cigar_samplers' api

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