When(/^(?:I |)search items by random '([ \w]+)' filter on '(\w+)' page$/) do |type, page|
  label = page.given.random_filter_label(type)
  page.given.filter_by(type, label)
  DataStorage::store('filters', 'params', api_filters_collection.find_filter(type, label))
end

Then(/^(?:I |)should see correctly filtered items on '(\w+)' page (through '\w+' api)$/) do |page, api|
  filters_params = DataStorage::extract('filters', 'params')
  expected_items = api.search(filters_params).items_product_ids
  actual_items = page.given.items_product_ids

  expect(actual_items).to eql expected_items
end