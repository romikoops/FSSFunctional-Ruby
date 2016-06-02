class SearchApi::Result
  attr_reader :items, :pagination, :filters, :sorts, :status, :suggested_keyword, :message

  def initialize(fields)
    @items = fields[:items]
    @pagination = fields[:pagination]
    @filters = fields[:helpers]
    @sorts = fields[:sorts]
    @status = fields[:status]
    @suggested_keyword = fields[:suggested_keyword]
    @message = fields[:message]
  end

  def items_names
    @items.map {|i| i[:NAME].to_s}
  end

  def items_product_ids
    @items.map {|i| i[:PRODUCT_IDd].to_s}
  end
end