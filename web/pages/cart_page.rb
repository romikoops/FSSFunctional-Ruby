class CartPage < Howitzer::Web::Page
  path '/cart'

  validate :url, %r{/cart}

  section :header
  section :email_modal_blocker

  element :item, '.cartadditem'

  def items_product_ids
    item_elements.map { |i| i[:'data-ihdnum'] }
  end
end
