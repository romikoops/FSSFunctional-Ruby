class SearchApi::Result
  include SearchApi::Helpers

  attr_reader :items, :filters, :sorts, :results_per_page, :selected_filters_url_string

  def initialize(raw_fields)
    fields = JSON.parse(raw_fields).with_indifferent_access

    @items = fields[:items]
    @filters = fields[:filters]
    @sorts = fields[:sorts]
    @results_per_page = fields[:pagination][:results_per_page_filter]
    @selected_filters_url_string = fields[:selected_filters_url_string]
  end

  def filter_names_from_group(group)
    filters.find { |f| f[:title].to_s.strip.downcase == group.downcase}[:filters]
      .map { |f| f[:key].to_sym }
  end

  def filter_by_title_from_group(group, title)
    filter = filters.find { |f| f[:title].to_s.strip.downcase == group.downcase }[:filters]
               .find { |f| f[:title].to_s.strip.downcase == sanitize_filter_label(title).downcase }

    { filter[:key].to_sym => filter[:value].to_s.strip }
  end

  def non_empty_brands
    filters.find { |f| f[:title].to_s.strip.downcase == 'brand' }[:filters]
      .select { |f| f[:COUNT] > 0 }.map { |f| f[:value].to_sym }
  end

  def items_names
    items.map {|i| i[:NAME].to_s}
  end

  def items_product_ids
    items.select {|el| el['QTY_IN_STOCK'].positive?}.map {|i| i[:PRODUCT_ID].to_s}
  end

  def random_item
    items.sample
  end

  def selected_filters
    params_to_hash(selected_filters_url_string)
  end
end
