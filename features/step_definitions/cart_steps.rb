#############################################################
#                      PREREQUISITES                        #
#############################################################

####################################
#              ACTIONS             #
####################################

When /^I am logged on famous-smoke.com$/ do
  LandingPage.open
end

When /^I go to '(.*)' segment$/ do |el|
  LandingPage.on { dropdown_menue(el) }
end

When /^I go to my cart$/ do
  AddedItemsPage.on { visit_my_cart }
end

When /^I add to cart first available gift card$/ do
  LandingPage.on { add_first_giftcard }
end

When /^I add to cart first available gift set$/ do
  LandingPage.on { add_first_giftset }
end

When /^I add to cart first available Accessories$/ do
  LandingPage.on { add_first_accessories }
end

When /^I move item to favorites$/ do
  CartPage.on { move_to_favorites }
end

When /^I change item quantity to '(\d)'$/ do |number|
  CartPage.on { change_quantity(number) }
end

When /^I use invalid promo code$/ do
  CartPage.on { use_invalid_promo }
end

When /^I preorder cigars item$/ do
  LandingPage.on { preorder_cigars }
end

####################################
#              CHECKS              #
####################################

Then /^Item should be in my cart$/ do
  CartPage.on { is_expected.to have_item_element }
end

Then /^I Shopping Cart should be empty$/ do
  CartPage.on { is_expected.to have_no_item_element }
end

Then /^I see that price is recalculated$/ do
  CartPage.on { price_was_recalculated }
end

Then /^I see warning that promo code is invalid$/ do
  CartPage.on { is_expected.to have_invalid_promo_element }
end
