class BrandPage < Howitzer::Web::Page
  path '/cart'

  validate :title, /^Shopping Cart \| Famous Smoke$/

  section :header
  section :email_modal_blocker

  element :item, '.brandnewbox a[data-product_id]'

  def items_product_ids
    item_elements.map { |i| i[:'data-product_id'] }
  end
end
