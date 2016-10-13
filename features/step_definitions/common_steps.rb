#############################################################
#                      PREREQUISITES                        #
#############################################################

Given /^registered (.*) user$/ do |user|
  RegistrationPage.register_user(user)
end

####################################
#              ACTIONS             #
####################################

When /^(?:I |)open '([\w]+)' page$/ do |page|
  page.open.close_email_modal_blocker
end

When /^(?:I |)open random '(product)' page in '([^']*)' filter set$/ do |page, set|
  cart_items = DataStorage.extract(:cart, :items) || []
  item = api.search(api.selected_filters(set)).random_item
  DataStorage.store(:cart, :items, cart_items << item[:PRODUCT_ID].to_s)
  page.open(product_url: item[:PRODUCT_URL]).close_email_modal_blocker
end

When /^(?:I |)add to cart item on opened '(product)' page$/ do |page|
  page.given.add_to_cart
end

When /^(?:I |)fill and submit form with the following data on '(\w+)' page:$/ do |page, data_table|
  page.open.close_email_modal_blocker.fill_form(data_table).submit_form
end

When /^(?:I |)fill form with the following data on '(\w+)' page:$/ do |page, data_table|
  page.given.fill_form(data_table)
end

When /^(?:I |)submit form on '(\w+)' page$/ do |page|
  page.given.submit_form
end

When /^(?:I |)open '([\w ]+)' page from main drop down menu on '(\w+)' page$/ do |text, page|
  page.open.expand_account_menu.click_account_link(text)
end

When(/^(?:I |)open reset password link from received to '(\w+)' user ('\w+' email)$/) do |user, email|
  visit email.find_by_recipient(user.email, app_host: Howitzer.app_host).reset_password_link
end

When(/^(?:I |)logout from account by direct link$/) do
  visit "#{WebPage.app_uri.site}/logout.cfm" # TODO: reimplement in better way
end

####################################
#              CHECKS              #
####################################

Then /^(?:I |)should see the following message on '([\w]+)' page:$/ do |page, text|
  expect(page.given.text).to include text
end

Then /^(?:I |)should see the following error messages on '([\w]+)' page:$/ do |page, data_table|
  expect(page.given.error_messages.sort).to eql(data_table.values.sort)
end

Then /^(?:I |)should be on '([\w]+)' page$/, &:given

Then /^(?:I |)should see that the user '(\w+)' receives ('\w+' email)$/ do |user, email|
  expect(email.find(user)).to be_valid
end

Then /^(?:I |)should see selected items on '(cart)' page$/ do |page|
  cart_items = DataStorage.extract(:cart, :items) || []
  expect(page.open.close_email_modal_blocker.items_product_ids).to eql cart_items
end
