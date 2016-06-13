When(/^(?:I |)search items by random '([, \w]+)' filter on '(\w+)' page with '([^']*)' filter set$/) do |groups, page, set|
  selected_filters = SearchApi::CigarSearch.selected_filters(set)

  groups.split(',').each do |group|
    label = page.given.random_filter_label(group)

    if label
      page.given.filter_by(group, label)
      selected_filters = merge_filters(selected_filters, SearchApi::CigarSearch.filter_by_title_from_group(set, group, label))
    end
  end

  DataStorage.store(:filters, :params, selected_filters)
end

When(/^(?:I |)clear '([, \w]+)' filters on '(\w+)' page with '([^']*)' filter set$/) do |groups, page, set|
  selected_filters = DataStorage::extract(:filters, :params)
  groups.split(',').map { |g| page.given.clear_filters(g) }
  removed_filters = groups.split(',').inject([]) { |r, g| r + SearchApi::CigarSearch.filter_names_by_group(set, g) }
  DataStorage.store(:filters, :params, selected_filters.delete_if { |k, _| removed_filters.include?(k) })
end

When(/^(?:I |)search items by following '([, \w]+)' filters on '(\w+)' page with '([^']*)' filter set:$/) do |groups, page, set, data|
  data.each do |name, value|
    page.given.fill_range_filter_by_name(name, value)
    page.given.apply_range_filter(groups)
  end

  DataStorage.store(:filters, :params, merge_filters(SearchApi::CigarSearch.selected_filters(set), data))
end

When(/^(?:I |)clear all filters on '(\w+)' page with '([^']*)' filter set$/) do |page, set|
  page.given.clear_all_filters
  DataStorage.store(:filters, :params, SearchApi::CigarSearch.selected_filters(set))
end

Then(/^(?:I |)should see correctly filtered items on '(\w+)' page$/) do |page|
  filters = DataStorage::extract(:filters, :params)
  expected_items = SearchApi::CigarSearch.search(filters).items_product_ids
  actual_items = page.given.items_product_ids
  expect(actual_items).to eql expected_items
end