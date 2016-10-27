class AddedItemsPage < Howitzer::Web::Page
  # path '/added-to-cart?'

  validate :title, /^Added To Cart \| Famous Smoke$/

  element :add_confirmation, :xpath,  "//div[text()='1 item added to cart']"
  element :my_cart,          :xpath,  "//*[@class='desktop-inline'][contains(.,'cart')]"

  def visit_my_cart
    my_cart_element.click
  end
end
