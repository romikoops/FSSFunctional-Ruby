Feature: Premium cigar samplers filtering basic

  Scenario Outline: Check filters
    When I open 'premium_cigar_samplers' page
    And search items by random '<filter_type>' filter on 'premium_cigar_samplers' page
    Then I should see correctly filtered items on 'premium_cigar_samplers' page through 'premium_cigar_samplers' api

    Examples:
      | filter_type    |
      | Promo          |
      | Country        |
      | Strength       |
      | Shape          |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |