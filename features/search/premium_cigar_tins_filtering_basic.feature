Feature: Premium cigar tins filtering basic

  Scenario Outline: Check filters
    When I open 'premium_cigar_tins' page
    And search items by random '<filter_type>' filter on 'premium_cigar_tins' page
    Then I should see correctly filtered items on 'premium_cigar_tins' page through 'premium_cigar_tins' api

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