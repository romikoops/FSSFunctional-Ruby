class CartPage < WebPage
  include HeaderSection
  include EmailModalBlockerSection

  url '/cart'

  validate :url, pattern: /#{Regexp.escape(app_url)}\/cart$/
  validate :title, pattern: /^Shopping Cart \| Famous Smoke$/

  add_locator :items, '.cartadditem'

  def items_product_ids
    # 'all(locator :items)' - returns array of elements
    # 'map { |i| i[:'data-ihdnum'] }' - gets attribute 'data-ihdnum' value from each element and return array of got attribute values
    all(locator :items).map { |i| i[:'data-ihdnum'] }
  end
end