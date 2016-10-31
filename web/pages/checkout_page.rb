class CheckoutPage < Howitzer::Web::Page
  path '/checkout'
  validate :title, /^Place Order \| Famous Smoke Shop$/

  iframe :card_number,            '#braintree-hosted-field-number'
  iframe :card_expiration,        '#braintree-hosted-field-expirationDate'

  element :cvv,                   "[name='cvv']"
  element :agree_terms,           "[for='terms'] .fakecheck"
  element :place_order,           :xpath, "//button[text()='place order']", visible: true, match: :first
  element :phone_verification,    '.infotitle.oswald.cred'

  def fill_credit_card(number, expiration, cvv)
    card_number_iframe { |frame| frame.fill_card_number(number) }
    card_expiration_iframe { |frame| frame.fill_expiration_date(expiration) }
    cvv_element.set(cvv)
  end

  def agree_terms
    agree_terms_element.click
  end

  def place_order
    place_order_element.click
  end
end
