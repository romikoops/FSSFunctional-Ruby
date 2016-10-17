#############################################################
#                      PREREQUISITES                        #
#############################################################

def handle_blocked_email_popup
  Howitzer.tries_small.times do
    sleep 1
    next if has_no_email_modal_blocker_section?
    email_modal_blocker_section.close
    break
  end
end

Given /^registered (.*) user$/ do |user|
  RegistrationPage.open
  RegistrationPage.on(&:handle_blocked_email_popup)
  RegistrationPage.on do
    fill_form(user.attributes)
    submit_form
    unless has_no_registration_form_element?
      Capybara.screenshot_and_open_image
      raise "User can not be registered with the following fields: #{user.attributes}"
    end
  end
end

####################################
#              ACTIONS             #
####################################

When /^(?:I |)open '([\w]+)' page$/ do |page|
  page.open
  page.on(&:handle_blocked_email_popup)
end

When /^(?:I |)open random '(product)' page in '([^']*)' filter set$/ do |page, set|
  cart_items = Howitzer::Cache.extract(:cart, :items) || []
  item = api.search(api.selected_filters(set)).random_item
  Howitzer::Cache.store(:cart, :items, cart_items << item[:PRODUCT_ID].to_s)
  page.open(product_path: item[:PRODUCT_URL], url_processor: UrlProcessor)
  page.on(&:handle_blocked_email_popup)
end

When /^(?:I |)fill and submit form with the following data on '(\w+)' page:$/ do |page, data_table|
  page.open
  page.on(&:handle_blocked_email_popup)
  page.on { fill_form(data_table.rows_hash).submit_form }
end

When /^(?:I |)fill form with the following data on '(\w+)' page:$/ do |page, data_table|
  page.given.fill_form(data_table.rows_hash)
end

When /^(?:I |)submit form on '(\w+)' page$/ do |page|
  page.given.submit_form
end

When /^(?:I |)open '([\w ]+)' page from main drop down menu on '(\w+)' page$/ do |text, page|
  page.open.expand_account_menu.click_account_link(text)
end

When(/^(?:I |)open reset password link from received to '(\w+)' user 'reset_password' email$/) do |user|
  ResetPasswordEmail.find_by_recipient(user.email, app_host: Howitzer.app_host).reset_password
end

When(/^(?:I |)logout from account by direct link$/) do
  Capybara.current_session.visit "#{WebPage.app_uri.site}/logout.cfm" # TODO: reimplement in better way
end

####################################
#              CHECKS              #
####################################

Then /^(?:I |)should see the following message on '([\w]+)' page:$/ do |page, text|
  expect(page.given.text).to include text
end

Then /^(?:I |)should see the following error messages on '([\w]+)' page:$/ do |page, data_table|
  expect(page.given.error_messages.sort).to eql(data_table.rows_hash.values.sort)
end

Then /^(?:I |)should be on '([\w]+)' page$/ do |page| # rubocop:disable Style/SymbolProc
  page.given
end

Then /^I should see that the user '(\w+)' receives 'reset_password' email$/ do |user|
  expect(ResetPasswordEmail.find_by_recipient(user.email, app_host: Howitzer.app_host)).to be_valid
end
