#############################################################
#                      PREREQUISITES                        #
#############################################################

####################################
#              ACTIONS             #
####################################

When /^I add to cart item on opened 'product' page$/ do
  ProductPage.on { add_to_cart }
end

When /^I open my cart$/ do
  CartPage.open
  CartPage.on(&:handle_blocked_email_popup)
end

####################################
#              CHECKS              #
####################################

Then /^I should see selected items on 'cart' page$/ do
  cart_items = Howitzer::Cache.extract(:cart, :items) || []
  CartPage.on { expect(items_product_ids).to eql cart_items }
end

Then /^I should see item is added to cart text$/ do
  expect(AddedToCartPage).to be_displayed
end
