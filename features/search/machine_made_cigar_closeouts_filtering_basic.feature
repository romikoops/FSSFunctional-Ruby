Feature: Machine made cigar closeouts filtering basic

  Scenario Outline: Check filters
    When I open 'machine_made_cigar_closeouts' page
    And search items by random '<filter_type>' filter on 'machine_made_cigar_closeouts' page
    Then I should see correctly filtered items on 'machine_made_cigar_closeouts' page through 'machine_made_cigar_closeouts' api

    Examples:
      | filter_type    |
      | Brand          |
      | Country        |
      | Strength       |
      | Package Type   |
      | Shape          |
      | Wrapper Leaf   |
      | Color          |
      | Wrapper Origin |
      | Flavor         |
      | Tube           |
