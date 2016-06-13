class BasePage < WebPage
  include EmailModalBlockerSection

  add_locator :filter_link,  ->(g, f) { { xpath: "//*[div[text()=\"#{g}\"]]//a[translate(text(), ' ', '')=translate(\"#{f}\", ' ', '')]" } }
  add_locator :filter_links, ->(g) { { xpath: "//*[div[text()=\"#{g}\"]]//a[@class='filterlink']" } }
  add_locator :clear_filters_button, ->(g) { { xpath: "//*[div[text()=\"#{g}\"]]//a[@class='clearbutton']" } }
  add_locator :clear_all_filters_button, xpath: '//*[@class="clearbutton"][translate(text(), " ", "")="ClearAllFilters"]'
  add_locator :items, '.allitems a[data-ihdnum]'
  add_locator :search_field, '.searchfield [name=kw]'
  add_locator :range_filter_field, ->(n) { { css: ".filterinput[type='number'][name='#{n}']" } }
  add_locator :apply_range_filter_button, ->(g) { { xpath: "//*[div[text()=\"#{g}\"]]//*[contains(@class,'filterbutton')]" } }

  def random_filter_label(group)
    log.info "Get random filter by type: '#{group}'"
    all(apply(locator(:filter_links), group)).sample.try :text
  end

  def items_product_ids
    all(locator :items).map { |e| e[:'data-ihdnum'] }
  end

  def filter_by(group, label)
    log.info "Filter items by '#{group}' -> '#{label}'"
    find(apply(locator(:filter_link), group, label)).click
  end

  def fill_range_filter_by_name(name, value)
    log.info "Fill range filter '#{name}' with '#{value}'"
    find(apply(locator(:range_filter_field), name)).set(value)
  end

  def apply_range_filter(group)
    log.info 'Apply filter'
    find(apply(locator(:apply_range_filter_button), group)).click
  end

  def clear_filters(group)
    log.info "Clear filter group '#{group}'"
    find(apply(locator(:clear_filters_button), group)).click
  end

  def clear_all_filters
    log.info 'Clear all filters'
    find(locator :clear_all_filters_button).click
  end
end