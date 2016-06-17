Feature: Cigar search filtering basic

  Scenario Outline: Check filtering combinations
    When I open 'cigar_search' page
    And search items by random '<filter_group>' filter on 'cigar_search' page with 'cigar-search' filter set
    Then I should see correctly filtered items on 'cigar_search' page

    Examples:
      | filter_group                  |
      | Price                         |
      | Promo                         |
      | Brand                         |
      | Rating                        |
      | Type                          |
      | Country                       |
      | Strength                      |
      | Package Type                  |
      | Quantity                      |
      | Ring Gauge                    |
      | Shape                         |
      | Length                        |
      | Wrapper Leaf                  |
      | Color                         |
      | Wrapper Origin                |
      | Flavor                        |
      | Tube                          |
      | Price,Price                   |
      | Promo,Promo                   |
      | Brand,Brand                   |
      | Rating,Rating                 |
      | Type,Type                     |
      | Country,Country               |
      | Strength,Strength             |
      | Package Type,Package Type     |
      | Quantity,Quantity             |
      | Ring Gauge,Ring Gauge         |
      | Shape,Shape                   |
      | Length,Length                 |
      | Wrapper Leaf,Wrapper Leaf     |
      | Color,Color                   |
      | Wrapper Origin,Wrapper Origin |
      | Flavor,Flavor                 |
      | Tube,Tube                     |
      | Price,Tube                    |
      | Promo,Price                   |
      | Brand,Promo                   |
      | Rating,Brand                  |
      | Type,Rating                   |
      | Country,Type                  |
      | Strength,Country              |
      | Package Type,Strength         |
      | Quantity,Package Type         |
      | Ring Gauge,Quantity           |
      | Shape,Ring Gauge              |
      | Length,Shape                  |
      | Wrapper Leaf,Length           |
      | Color,Wrapper Leaf            |
      | Wrapper Origin,Color          |
      | Flavor,Wrapper Origin         |
      | Tube,Flavor                   |


  Scenario Outline: Check filtering with filter sets
    When I open '<page>' page
    And search items by random '<filter_group>' filter on '<page>' page with '<filter_set>' filter set
    Then I should see correctly filtered items on '<page>' page

    Examples:
      | page                             | filter_set                              | filter_group   |
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


  Scenario Outline: Check filters clearing
    When I open 'cigar_search' page
    And search items by random '<filter_group>' filter on 'cigar_search' page with 'cigar-search' filter set
    And clear '<clear_filter_group>' filters on 'cigar_search' page with 'cigar-search' filter set
    Then I should see correctly filtered items on 'cigar_search' page

    Examples:
      | filter_group                  | clear_filter_group            |
      | Price                         | Price                         |
      | Promo                         | Promo                         |
      | Brand                         | Brand                         |
      | Rating                        | Rating                        |
      | Type                          | Type                          |
      | Country                       | Country                       |
      | Strength                      | Strength                      |
      | Package Type                  | Package Type                  |
      | Quantity                      | Quantity                      |
      | Ring Gauge                    | Ring Gauge                    |
      | Shape                         | Shape                         |
      | Length                        | Length                        |
      | Wrapper Leaf                  | Wrapper Leaf                  |
      | Color                         | Color                         |
      | Wrapper Origin                | Wrapper Origin                |
      | Flavor                        | Flavor                        |
      | Tube                          | Tube                          |
      | Price,Price                   | Price                         |
      | Promo,Promo                   | Promo                         |
      | Brand,Brand                   | Brand                         |
      | Rating,Rating                 | Rating                        |
      | Type,Type                     | Type                          |
      | Country,Country               | Country                       |
      | Strength,Strength             | Strength                      |
      | Package Type,Package Type     | Package Type                  |
      | Quantity,Quantity             | Quantity                      |
      | Ring Gauge,Ring Gauge         | Ring Gauge                    |
      | Shape,Shape                   | Shape                         |
      | Length,Length                 | Length                        |
      | Wrapper Leaf,Wrapper Leaf     | Wrapper Leaf                  |
      | Color,Color                   | Color                         |
      | Wrapper Origin,Wrapper Origin | Wrapper Origin                |
      | Flavor,Flavor                 | Flavor                        |
      | Tube,Tube                     | Tube                          |
      | Price,Tube                    | Price                         |
      | Promo,Price                   | Promo                         |
      | Brand,Promo                   | Brand                         |
      | Rating,Brand                  | Rating                        |
      | Type,Rating                   | Type                          |
      | Country,Type                  | Country                       |
      | Strength,Country              | Strength                      |
      | Package Type,Strength         | Package Type                  |
      | Quantity,Package Type         | Quantity                      |
      | Ring Gauge,Quantity           | Ring Gauge                    |
      | Shape,Ring Gauge              | Shape                         |
      | Length,Shape                  | Length                        |
      | Wrapper Leaf,Length           | Wrapper Leaf                  |
      | Color,Wrapper Leaf            | Color                         |
      | Wrapper Origin,Color          | Wrapper Origin                |
      | Flavor,Wrapper Origin         | Flavor                        |
      | Tube,Flavor                   | Tube                          |


  Scenario Outline: Check range filtering
    When I open 'cigar_search' page
    And search items by following '<filter_group>' filters on 'cigar_search' page with 'cigar-search' filter set:
      | <min_key> | <min_value> |
      | <max_key> | <max_value> |
    Then I should see correctly filtered items on 'cigar_search' page

    Examples:
      | filter_group | min_key        | min_value | max_key        | max_value |
      | Price        | min_price      | 0         | max_price      | 1         |
      | Price        | min_price      | 99999     | max_price      | 999999    |
      | Price        | min_price      | 30        | max_price      | 50        |
      | Price        | min_price      | 0         | max_price      | 999999    |
      | Rating       | min_avg_rating | 0         | max_avg_rating | 1         |
      | Rating       | min_avg_rating | 99999     | max_avg_rating | 999999    |
      | Rating       | min_avg_rating | 40        | max_avg_rating | 70        |
      | Rating       | min_avg_rating | 0         | max_avg_rating | 999999    |
      | Quantity     | min_qty        | 0         | max_qty        | 1         |
      | Quantity     | min_qty        | 99999     | max_qty        | 999999    |
      | Quantity     | min_qty        | 5         | max_qty        | 20        |
      | Quantity     | min_qty        | 0         | max_qty        | 999999    |
      | Ring Gauge   | min_ring_gauge | 0         | max_ring_gauge | 1         |
      | Ring Gauge   | min_ring_gauge | 99999     | max_ring_gauge | 999999    |
      | Ring Gauge   | min_ring_gauge | 5         | max_ring_gauge | 20        |
      | Ring Gauge   | min_ring_gauge | 0         | max_ring_gauge | 999999    |
      | Length       | min_length     | 0         | max_length     | 1         |
      | Length       | min_length     | 99999     | max_length     | 999999    |
      | Length       | min_length     | 10        | max_length     | 30        |
      | Length       | min_length     | 0         | max_length     | 999999    |


  Scenario Outline: Check results per page functionality
    When I open 'cigar_search' page
    And select results per page '<count>' on page 'cigar_search' with 'cigar-search' filter set
    Then I should see '<count>' items on 'cigar_search' page
    And should see correctly filtered items on 'cigar_search' page

    Examples:
      | count |
      | 60    |
      | 120   |
      | 180   |
      | 240   |


  Scenario Outline: Check sorting functionality
    When I open 'cigar_search' page
    And select sorting '<sorting>' on page 'cigar_search' with 'cigar-search' filter set
    Then I should see correctly filtered items on 'cigar_search' page

    Examples:
      | sorting          |
      | best_desc        |
      | price_asc        |
      | price_desc       |
      | name_asc         |
      | name_desc        |
      | percent_off_desc |
      | avg_rating_asc   |
      | avg_rating_desc  |
      | tsaled_asc       |


  Scenario Outline: Check sorting filtering and results per page combinations
    When I open 'cigar_search' page
    And search items by random '<filter_group>' filter on 'cigar_search' page with 'cigar-search' filter set
    And select results per page '<count>' on page 'cigar_search' with 'cigar-search' filter set
    And select sorting '<sorting>' on page 'cigar_search' with 'cigar-search' filter set
    Then I should see correctly filtered items on 'cigar_search' page

    Examples:
      | filter_group           | sorting          | count |
      | Promo                  | price_asc        | 120   |
      | Brand                  | price_desc       | 180   |
      | Rating                 | name_asc         | 240   |
      | Type                   | name_desc        | 120   |
      | Country                | percent_off_desc | 180   |
      | Strength               | avg_rating_asc   | 240   |
      | Package Type           | avg_rating_desc  | 120   |
      | Quantity               | tsaled_asc       | 180   |
      | Price,Ring Gauge       | price_asc        | 240   |
      | Promo,Shape            | price_desc       | 120   |
      | Brand,Length           | name_asc         | 180   |
      | Rating,Wrapper Leaf    | name_desc        | 240   |
      | Type,Color             | percent_off_desc | 120   |
      | Country,Wrapper Origin | avg_rating_asc   | 180   |
      | Strength,Flavor        | avg_rating_desc  | 240   |


  Scenario Outline: Check clearing all filters
    When I open 'cigar_search' page
    And search items by random '<filter_group>' filter on 'cigar_search' page with 'cigar-search' filter set
    And clear all filters on 'cigar_search' page with 'cigar-search' filter set
    Then I should see correctly filtered items on 'cigar_search' page

    Examples:
      | filter_group  |
      | Price         |
      | Promo,Promo   |
      | Brand,Country |


  Scenario Outline: Check clearing all sorting filtering and results per page
    When I open 'cigar_search' page
    And search items by random '<filter_group>' filter on 'cigar_search' page with 'cigar-search' filter set
    And select results per page '<count>' on page 'cigar_search' with 'cigar-search' filter set
    And select sorting '<sorting>' on page 'cigar_search' with 'cigar-search' filter set
    And clear all filters on 'cigar_search' page with 'cigar-search' filter set
    Then I should see correctly filtered items on 'cigar_search' page

    Examples:
      | filter_group           | sorting          | count |
      | Promo                  | price_asc        | 120   |
      | Brand                  | price_desc       | 180   |
      | Rating                 | name_asc         | 240   |
      | Type                   | name_desc        | 120   |
      | Rating,Wrapper Leaf    | percent_off_desc | 180   |
      | Type,Color             | avg_rating_asc   | 240   |
      | Country,Wrapper Origin | avg_rating_desc  | 120   |
      | Strength,Flavor        | avg_rating_desc  | 120   |