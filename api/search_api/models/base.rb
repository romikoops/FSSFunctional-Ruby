class SearchApi::Models::Base
  def self.object_type
  end

  def self.default_params
    { json: true, results_per_page: 48, sort: 'best_desc' }
  end

  def self.url
    "http://testing.famous-smoke.com/#{object_type}"
  end

  def self.search(params={})
    responce = RestClient.get(url, params: default_params.merge(params))
    SearchApi::Result.new(JSON.parse(responce).with_indifferent_access)
  end
end