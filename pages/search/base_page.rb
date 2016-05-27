class BasePage < WebPage
  include EmailModalBlockerSection

  add_locator :filter_link,  ->(t, f) { { xpath: "//*[*[text()=\"#{t}\"]]//a[translate(text(), ' 0123456789()', '')=translate(\"#{f}\", ' 0123456789()', '')]" } }
  add_locator :filter_links, ->(t) { { xpath: "//*[*[text()=\"#{t}\"]]//a[contains(@class, 'filterlink')][not(contains(@class, 'hidden'))]" } }
  add_locator :items, '.allitems a[data-ihdnum]'

  def filter_by(type, label)
    log.info "Filter items by '#{type}' -> '#{label}'"
    find(apply(locator(:filter_link), type, label)).click
  end

  def random_filter_label(type)
    log.info "Get random filter by type: '#{type}'"
    all(apply(locator(:filter_links), type)).sample.text.gsub(/(?:^ *| *\(\d+\) *$)/, '')
  end

  def items_product_ids
    all(locator :items).map { |e| e[:'data-ihdnum'] }
  end
end