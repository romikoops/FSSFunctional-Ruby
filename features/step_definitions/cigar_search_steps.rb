When(
  /^(?:I |)search items by random '([, \w]+)' filter on '(\w+)' page with '([^']*)' filter set$/
) do |groups, page, set|
  selected_filters = Howitzer::Cache.extract(:filters, :params) || api.selected_filters(set)

  groups.split(',').each do |group|
    label = page.given.random_filter_label(group)

    next unless label
    page.given.filter_by(group, label)
    selected_filters = SearchApi::Helpers.merge_filters(
      selected_filters,
      api.filter_by_title_from_group(group, label, set)
    )
  end

  Howitzer::Cache.store(:filters, :params, selected_filters)
end

When(/^(?:I |)clear '([, \w]+)' filters on '(\w+)' page with '([^']*)' filter set$/) do |groups, page, set|
  selected_filters = Howitzer::Cache.extract(:filters, :params) || api.selected_filters(set)
  groups.split(',').map { |g| page.given.clear_filters(g) }
  removed_filters = groups.split(',').inject([]) { |a, e| a + api.filter_names_from_group(e, set) }
  Howitzer::Cache.store(:filters, :params, selected_filters.delete_if { |k, _| removed_filters.include?(k) })
end

When(
  /^(?:I |)search items by following '([, \w]+)' filters on '(\w+)' page with '([^']*)' filter set:$/
) do |groups, page, set, data|
  selected_filters = Howitzer::Cache.extract(:filters, :params) || api.selected_filters(set)

  data.each do |name, value|
    page.given.fill_range_filter_by_name(name, value)
    page.given.apply_range_filter(groups)
  end

  Howitzer::Cache.store(:filters, :params, SearchApi::Helpers.merge_filters(selected_filters, data))
end

When(/^(?:I |)clear all filters on '(\w+)' page with '([^']*)' filter set$/) do |page, set|
  selected_filters = Howitzer::Cache.extract(:filters, :params) || api.selected_filters(set)
  page.given.clear_all_filters
  selected_filters = selected_filters.delete_if { |k, _| ![:sort, :results_per_page].include?(k) }
  Howitzer::Cache.store(:filters, :params, selected_filters)
end

When(/^(?:I |)select results per page '(\d+)' on page '(\w+)' with '([^']*)' filter set$/) do |count, page, set|
  selected_filters = Howitzer::Cache.extract(:filters, :params) || api.selected_filters(set)
  page.given.select_results_per_page(count)
  Howitzer::Cache.store(:filters, :params, selected_filters.merge(results_per_page: count))
end

When(/^(?:I |)select sorting '([^']+)' on page '(\w+)' with '([^']*)' filter set$/) do |sorting, page, set|
  selected_filters = Howitzer::Cache.extract(:filters, :params) || api.selected_filters(set)
  page.given.select_sorting(sorting)
  Howitzer::Cache.store(:filters, :params, selected_filters.merge(sort: sorting))
end

Then(/^(?:I |)should see '(\d+)' items on '(\w+)' page$/) do |count, page|
  expect(page.given.items_product_ids.count).to eql count.to_i
end

Then(/^(?:I |)should see correctly filtered items on '(\w+)' page$/) do |page|
  expected_items = api.search(Howitzer::Cache.extract(:filters, :params)).items_product_ids
  actual_items = page.given.items_product_ids
  expect(actual_items).to eql expected_items
end
