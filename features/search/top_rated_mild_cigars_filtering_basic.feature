Feature: Top rated mild cigars filtering basic

  Scenario Outline: Check filters
    When I open 'top_rated_mild_cigars' page
    And search items by random '<filter_type>' filter on 'top_rated_mild_cigars' page
    Then I should see correctly filtered items on 'top_rated_mild_cigars' page through 'top_rated_mild_cigars' api

    Examples:
      | filter_type    |
      | Promo          |
      | Brand          |
