# BasePage class is abstract page class which describes common elements locators
# and methods to communicate with elements on search pages
class BasePage < WebPage
  include HeaderSection
  include EmailModalBlockerSection

  # elements locators
  add_locator :filter_link,  ->(g, f) { { xpath: "//*[div[text()=\"#{g}\"]]//a[translate(text(), ' ', '')=translate(\"#{f}\", ' ', '')]" } }
  add_locator :filter_links, ->(g) { { xpath: "//*[div[text()=\"#{g}\"]]//a[@class='filterlink']" } }
  add_locator :clear_filters_button, ->(g) { { xpath: "//*[div[text()=\"#{g}\"]]//a[@class='clearbutton']" } }
  add_locator :clear_all_filters_button, xpath: '//*[@class="clearbutton"][translate(text(), " ", "")="ClearAllFilters"]'
  add_locator :items, '.allitems a[data-ihdnum]'
  add_locator :search_field, '.searchfield [name=kw]'
  add_locator :range_filter_field, ->(n) { { css: ".filterinput[type='number'][name='#{n}']" } }
  add_locator :apply_range_filter_button, ->(g) { { xpath: "//*[div[text()=\"#{g}\"]]//*[contains(@class,'filterbutton')]" } }
  add_locator :results_per_page_expander, '[for="results1"]'
  add_locator :results_per_page_link, ->(c) { { xpath: "//*[contains(@class,'resultselect')][.//*[@id='results1']]//a[text()='#{c}']"} }
  add_locator :results_per_page_links, '[for="results1"] ~ .filterlist a'
  add_locator :sorting_expander, '[for="sort1"]'
  add_locator :sorting_link, ->(s) { { xpath: "//*[contains(@class,'sortselect')][.//*[@id='sort1']]//a[contains(@href, '#{s}')]"} }
  add_locator :sorting_links, '[for="sort1"] ~ .filterlist a'

  # selects 'results per page' item by 'count' on search page
  def select_results_per_page(count)
    log.info "Select results per page: '#{count}'"
    # 'find...' method to find element on page by given locator
    # 'locator :results_per_page_expander' returns locator by name 'results_per_page_expander'
    #    in current case it is - '[for="results1"]'
    find(locator :results_per_page_expander).click # expands 'results per page' select box
    find(apply(locator(:results_per_page_link), count)).click # find and click item in expanded 'results per page' select box
  end

  # selects 'sorting' item by 'sorting' on search page
  def select_sorting(sorting)
    log.info "Select sorting: '#{sorting}'"
    find(locator :sorting_expander).click # expands 'sorting' select box
    find(apply(locator(:sorting_link), sorting)).click # find and click item in expanded 'sorting' select box
  end

  # clicks random filter from given filter group
  def random_filter_label(group)
    log.info "Get random filter by type: '#{group}'"
    # 'all...' method to find all elements (as array) on page by given locator
    # 'apply...' method to apply some variables for given locator and returns generated locator
    #    in current case 'apply(locator(:filter_links), group)'
    #    apply method insert to locator xpath: "//*[div[text()=\"#{g}\"]]//a[@class='filterlink']"
    #    group variable value
    #    so, result of this method will be locator, which will be passe to methods 'all' or 'find'
    #      for example:
    #        'group' variable has value 'Type'
    #         result will be [:xpath, "//*[div[text()=\"Type\"]]//a[@class='filterlink']"]
    # 'sample' method to select random element from array
    # 'try :text' method 'try' need to safe call method 'text' from object
    #    for example:
    #      if method 'all' returned array of elements,
    #          method sample will return web some element with has method text
    #          so, 'try :text' returns element text
    #      if method 'all' returned empty array (when there are no needed elements on page),
    #          method sample will return 'nil' object with doesn't have method text
    #          so, 'try :text' returns 'nil' instead of exception
    all(apply(locator(:filter_links), group)).sample.try :text
  end

  # returns array of product ids
  def items_product_ids
    # 'all(locator :items)' - returns array of elements
    # 'map { |i| i[:'data-ihdnum'] }' - gets attribute 'data-ihdnum' value from each element and return array of got attribute values
    all(locator :items).map { |i| i[:'data-ihdnum'] }
  end

  # clicks filter link by given text ('label' variable) in filter group
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

  # clicks clear filter link in given group
  def clear_filters(group)
    log.info "Clear filter group '#{group}'"
    find(apply(locator(:clear_filters_button), group)).click
  end

  # clicks clear all filters
  def clear_all_filters
    log.info 'Clear all filters'
    find(locator :clear_all_filters_button).click
  end
end