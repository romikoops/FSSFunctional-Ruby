module SearchApi
  class Result
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
      filters.find { |f| f[:title].to_s.strip.casecmp(group.downcase).zero? }[:filters]
             .map { |f| f[:key].to_sym }
    end

    def filter_by_title_from_group(group, title) # rubocop:disable Metrics/AbcSize
      filter = filters.find { |f| f[:title].to_s.strip.casecmp(group.downcase).zero? }[:filters]
                      .find { |f| f[:title].to_s.strip.casecmp(sanitize_filter_label(title).downcase).zero? }

      { filter[:key].to_sym => filter[:value].to_s.strip }
    end

    def non_empty_brands
      filters.find { |f| f[:title].to_s.strip.casecmp('brand').zero? }[:filters]
             .select { |f| (f[:COUNT]).positive? }.map { |f| f[:value].to_sym }
    end

    def items_names
      items.map { |i| i[:NAME].to_s }
    end

    def items_product_ids
      items.select { |el| el['QTY_IN_STOCK'].positive? }.map { |i| i[:PRODUCT_ID].to_s }
    end

    def random_item
      items.sample
    end

    def selected_filters
      params_to_hash(selected_filters_url_string)
    end
  end
end
