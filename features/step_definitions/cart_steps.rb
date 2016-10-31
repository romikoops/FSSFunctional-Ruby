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
  LandingPage.on { dropdown_menu(el) }
end

When /^I go to my cart$/ do
  AddedItemsPage.on { visit_my_cart }
end

When /^I go directly to my cart$/ do
  LandingPage.on { visit_my_cart }
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

When /^I add free shipping item to the cart$/ do
  LandingPage.on { add_free_shipping_item }
end

When /^I buy one of listed offers$/ do
  LandingPage.on { buy_offer }
end

When /^I add item with free stuff$/ do
  LandingPage.on { add_free_item }
end

When /^I change first item quantity to '(\d)'$/ do |number|
  CartPage.on { change_first_item_q(number) }
end

When /^I see that my cart is empty$/ do
  CartPage.on { is_expected.to have_empty_cart_element }
end

When /^I proceed with checkout using pay-pal$/ do
  CartPage.on { checkout }
  LoginPage.on { login_as_existing_user('uofvr3w@mg.strongqa.com', '!Test_P@55woRD!') }
  CheckoutPage.on do
    fill_credit_card('5555555555554444', '1020', '123')
    agree_terms
    place_order
  end
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

Then /^I see free item in my cart$/ do
  CartPage.on { is_expected.to have_free_item_element }
end

Then /^I cannot proceed with checkout$/ do
  CartPage.on { is_expected.to have_no_proceed_to_checkout_element }
end

Then /^I see order 'phone verifecation' message$/ do
  CheckoutPage.on { is_expected.to have_phone_verification_element }
end
