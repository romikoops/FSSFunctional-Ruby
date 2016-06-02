Feature: Best of cigar samplers filtering basic

  Scenario Outline: Check filters
    When I open 'best_of_cigar_samplers' page
    And search items by random '<filter_type>' filter on 'best_of_cigar_samplers' page
    Then I should see correctly filtered items on 'best_of_cigar_samplers' page through 'best_of_cigar_samplers' api

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