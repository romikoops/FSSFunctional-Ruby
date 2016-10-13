# BasePage class is abstract page class which describes common elements locators
# and methods to communicate with elements on search pages
class BasePage < Howitzer::Web::Page
  section :header
  section :email_modal_blocker

  element :filter_link, :xpath, ->(g, f) { "//*[div[text()=\"#{g}\"]]//a[translate(text(), ' ', '')=translate(\"#{f}\", ' ', '')]" }
  element :filter_links, :xpath, ->(g) { "//*[div[text()=\"#{g}\"]]//a[@class='filterlink']" }
  element :clear_filters_button, :xpath, ->(g) { "//*[div[text()=\"#{g}\"]]//a[@class='clearbutton']" }
  element :clear_all_filters_button, :xpath, '//*[@class="clearbutton"][translate(text(), " ", "")="ClearAllFilters"]'
  element :item, '.allitems a[data-ihdnum]'
  element :search_field, '.searchfield [name=kw]'
  element :range_filter_field, :css, ->(n) { ".filterinput[type='number'][name='#{n}']" }
  element :apply_range_filter_button, :xpath, ->(g) { "//*[div[text()=\"#{g}\"]]//*[contains(@class,'filterbutton')]" }
  element :results_per_page_expander, '[for="results1"]'
  element :results_per_page_link, :xpath, ->(c) { "//*[contains(@class,'resultselect')][.//*[@id='results1']]//a[text()='#{c}']" }
  element :results_per_page_links, '[for="results1"] ~ .filterlist a'
  element :sorting_expander, '[for="sort1"]'
  element :sorting_link, :xpath, ->(s) { "//*[contains(@class,'sortselect')][.//*[@id='sort1']]//a[contains(@href, '#{s}')]" }
  element :sorting_links, '[for="sort1"] ~ .filterlist a'

  # selects 'results per page' item by 'count' on search page
  def select_results_per_page(count)
    log.info "Select results per page: '#{count}'"
    results_per_page_expander_element.click # expands 'results per page' select box
    results_per_page_link_element(count).click # find and click item in expanded 'results per page' select box
  end

  # selects 'sorting' item by 'sorting' on search page
  def select_sorting(sorting)
    log.info "Select sorting: '#{sorting}'"
    sorting_expander_element.click # expands 'sorting' select box
    sorting_link_element(sorting).click # find and click item in expanded 'sorting' select box
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
    filter_links_elements(group).sample.try :text
  end

  # returns array of product ids
  def items_product_ids
    item_elements.map { |i| i[:'data-ihdnum'] } # gets attribute 'data-ihdnum' value from each element and return array of got attribute values
  end

  # clicks filter link by given text ('label' variable) in filter group
  def filter_by(group, label)
    log.info "Filter items by '#{group}' -> '#{label}'"
    filter_link_element(group, label).click
  end

  def fill_range_filter_by_name(name, value)
    log.info "Fill range filter '#{name}' with '#{value}'"
    range_filter_field_element(name).set(value)
  end

  def apply_range_filter(group)
    log.info 'Apply filter'
    apply_range_filter_button_element(group).click
  end

  # clicks clear filter link in given group
  def clear_filters(group)
    log.info "Clear filter group '#{group}'"
    clear_filters_button_element(group).click
  end

  # clicks clear all filters
  def clear_all_filters
    log.info 'Clear all filters'
    clear_all_filters_button_element.click
  end
end
