class ProductPage < Howitzer::Web::Page
  path '{product_url}' # TODO

  validate :url, /#{Regexp.escape(Howitzer.app_uri.site)}\/[^\/]+\/item\+\d+$/

  section :header
  section :email_modal_blocker

  element :add_to_cart_button, ':checked+.ic a[href*=add-to-cart]'

  def add_to_cart
    add_to_cart_button_element.click
  end
end
