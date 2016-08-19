class BrandPage < WebPage
  include HeaderSection
  include EmailModalBlockerSection

  url '/cart'

  validate :url, pattern: /#{Regexp.escape(app_url)}\/cart$/
  validate :title, pattern: /^Shopping Cart \| Famous Smoke$/


  add_locator :items, '.brandnewbox a[data-product_id]'

  def items_product_ids
    all(locator :items).map { |i| i[:'data-product_id'] }
  end
end