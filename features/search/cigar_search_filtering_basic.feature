Feature Cigar search filtering basic

  Scenario Outline: Check basic filters
    When I open '<page>' page
    And search items by random '<filter_type>' filter on '<page>' page with '<filter_set>' filter set
    Then I should see correctly filtered items on '<page>' page

    Examples:
      | page         | filter_set   | filter_type    |
      | cigar_search | cigar-search | Promo          |
      | cigar_search | cigar-search | Brand          |
      | cigar_search | cigar-search | Type           |
      | cigar_search | cigar-search | Country        |
      | cigar_search | cigar-search | Strength       |
      | cigar_search | cigar-search | Package Type   |
      | cigar_search | cigar-search | Shape          |
      | cigar_search | cigar-search | Wrapper Leaf   |
      | cigar_search | cigar-search | Color          |
      | cigar_search | cigar-search | Wrapper Origin |
      | cigar_search | cigar-search | Flavor         |
      | cigar_search | cigar-search | Tube           |

  Scenario Outline: Check basic filters with filter sets
    When I open '<page>' page
    And search items by random '<filter_type>' filter on '<page>' page with '<filter_set>' filter set
    Then I should see correctly filtered items on '<page>' page

    Examples:
      | page                             | filter_set                              | filter_type    |
      | american_cigars                  | cigars/american-cigars                  | Promo          |
      | best_of_cigar_samplers           | cigars/best-of-cigar-samplers           | Brand          |
      | box_cigars                       | cigars/box-cigars                       | Country        |
      | bundle_cigars                    | cigars/bundle-cigars                    | Strength       |
      | full_bodied_cigars               | cigars/full-bodied-cigars               | Package Type   |
      | carton_cigars                    | cigars/carton-cigars                    | Shape          |
      | medium_bodied_cigars             | cigars/medium-bodied-cigars             | Color          |
      | cigar_10_packs                   | cigars/cigar-10-packs                   | Wrapper Origin |
      | cigar_packs                      | cigars/cigar-packs                      | Flavor         |
      | cigar_samplers                   | cigars/cigar-samplers                   | Tube           |
      | cigar_tins                       | cigars/cigar-tins                       | Promo          |
      | cigarillos_cigars                | cigars/cigarillos-cigars                | Brand          |
      | jar_cigars                       | cigars/jar-cigars                       | Country        |
      | dominican_cigars                 | cigars/dominican-cigars                 | Strength       |
      | honduran_cigars                  | cigars/honduran-cigars                  | Package Type   |
      | liquidation_cigar_samplers       | cigars/liquidation-cigar-samplers       | Shape          |
      | machine_made_cigar_closeouts     | cigars/machine-made-cigar-closeouts     | Wrapper Leaf   |
      | machine_made_cigars              | cigars/machine-made-cigars              | Color          |
      | mexican_cigars                   | cigars/mexican-cigars                   | Wrapper Origin |
      | mild_cigars                      | cigars/mild-cigars                      | Flavor         |
      | premium_cigar_samplers           | cigars/premium-cigar-samplers           | Tube           |
      | premium_cigar_tins               | cigars/premium-cigar-tins               | Promo          |
      | top_rated_mild_cigars            | cigars/top-rated-mild-cigars            | Brand          |
      | top_rated_pairing_cigar_samplers | cigars/top-rated-pairing-cigar-samplers | Type           |
      | premium_cigars                   | cigars/premium-cigars                   | Country        |
      | single_cigars                    | cigars/single-cigars                    | Strength       |
      | small_cigars                     | cigars/small-cigars                     | Package Type   |