When /^(?:I |)I open '([\w]+)' page$/ do |page|
  page.open.close_email_modal_blocker
end

When /^(?:I |)fill form with following data on '(\w+)' page:$/ do |page, data_table|
  page.given.fill_fields data_table.rows_hash.with_indifferent_access
end

When /^(?:I |)submit form on '(\w+)' page$/ do |page|
  page.given.submit_form
end

Then /^(?:I |)should be on '([\w]+)' page$/ do |page|
  page.given
end