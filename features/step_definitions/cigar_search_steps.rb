When(/^(?:I |)search items by random '([ \w]+)' filter on '(\w+)' page with '([^']*)' filter set$/) do |group, page, filter_set|
  title = page.given.random_filter_label(group)
  page.given.filter_by(group, title)
  selected_filters = SearchApi::CigarSearch.selected_filters(filter_set)
  filter = SearchApi::CigarSearch.filter_by_title_from_group(filter_set, group, title)
  DataStorage::store('filters', 'params', selected_filters.merge(filter))
end

Then(/^(?:I |)should see correctly filtered items on '(\w+)' page$/) do |page|
  filters_params = DataStorage::extract('filters', 'params')

  expected_items = SearchApi::CigarSearch.search(filters_params).items_product_ids
  actual_items = page.given.items_product_ids

  expect(actual_items).to eql expected_items
end