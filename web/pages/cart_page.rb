class CartPage < Howitzer::Web::Page
  path '/cart'

  validate :title, /^Shopping Cart \| Famous Smoke$/

  section :header
  section :email_modal_blocker

  element :item,                  '.cartadditem'
  element :promo_code,            '.cart_promo>input'
  element :invalid_promo,         '.txterror'
  element :empty_cart,            '.cartbigcol>h3'
  element :quantity,              :xpath,  "//*[@class='cartqty']"
  element :move_to_favorites,     :xpath,  "//a[text()='Move to favorites']"
  element :unit_price,            :xpath,  "//*[@class='price pay-price']"
  element :price_amount,  :xpath, ->(el)   { "//b[contains(.,'$#{el}')]" }
  element :item_in_cart,  :xpath, ->(el)   { "//*[@class='cnum'][contains(.,'#{el}')]" }
  element :redeem,                :xpath,  "//button[contains(.,'redeem')]"
  element :free_item,             :xpath,  "//*[@class='price pay-price'][contains(.,'FREE')]"
  element :proceed_to_checkout,   '.buttonleft'

  def move_to_favorites
    Howitzer::Log.info 'Move item to favorites'
    quantity_element
    move_to_favorites_element.click
  end

  def change_quantity(number)
    Howitzer::Log.info "Change quantity to: #{number}"
    price_before_change = unit_price_element.text
    Howitzer::Log.info "Price before: #{price_before_change}"
    Howitzer::Cache.store(:keyone, :keytwo, price_before_change)
    Howitzer::Cache.store(:keythree, :keyfour, number)
    quantity_element.select(number)
  end

  def price_was_recalculated
    before_price = Howitzer::Cache.extract(:keyone, :keytwo)
    amount = Howitzer::Cache.extract(:keythree, :keyfour)
    new_price = before_price.delete!('$').to_i * amount.to_i

    price_amount_element(new_price)
    Howitzer::Log.info "Price after: $#{new_price}"
  end

  def use_invalid_promo
    promo_code_element.set('invalid_promo')
    redeem_element.click
  end

  def change_first_item_q(number)
    quantity_elements.first.select(number)
  end

  def checkout
    proceed_to_checkout_elements.last.click
  end
end
