class SearchApi::Result
  include SearchApi::Helpers

  attr_reader :items, :pagination, :filters, :sorts, :status, :suggested_keyword, :message, :selected_filters_url_string

  def initialize(raw_fields)
    fields = JSON.parse(raw_fields).with_indifferent_access

    @items = fields[:items]
    @pagination = fields[:pagination]
    @filters = fields[:filters]
    @sorts = fields[:sorts]
    @status = fields[:status]
    @suggested_keyword = fields[:suggested_keyword]
    @message = fields[:message]
    @selected_filters_url_string = fields[:selected_filters_url_string]
  end

  def items_names
    @items.map {|i| i[:NAME].to_s}
  end

  def items_product_ids
    @items.map {|i| i[:PRODUCT_ID].to_s}
  end

  def selected_filters
    params_to_hash(selected_filters_url_string)
  end
end