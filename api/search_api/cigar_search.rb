class SearchApi::CigarSearch
  DEFAULT_FILTER_SET = 'cigar-search'

  class << self
    def search(filters={})
      responce = get(search_url, default_filters.merge(filters))
      SearchApi::Result.new(responce)
    end

    def selected_filters(filter_set=DEFAULT_FILTER_SET)
      responce = get(api_url(filter_set), json: true, filters_only: true)
      SearchApi::Result.new(responce).selected_filters
    end

    def available_filters(filter_set=DEFAULT_FILTER_SET)
      responce = get(api_url(filter_set), json: true, filters_only: true)
      SearchApi::Result.new(responce).filters
    end

    def filter_by_title_from_group(filter_set=DEFAULT_FILTER_SET, group, title)
      filter = available_filters(filter_set)
          .find {|f| f[:title].strip.downcase == group.downcase}[:filters]
          .find {|f| f[:title].strip.downcase == title.downcase}

      { filter[:key] => filter[:value].to_s.strip }
    end

    def default_filters
      { json: true, results_per_page: 60, sort: 'best_desc' }
    end

    private

    def api_url(type)
      "http://testing.famous-smoke.com/#{type}"
    end

    def search_url
      api_url(DEFAULT_FILTER_SET)
    end

    def get(url=search_url, params={})
      params = params.inject({}) {|r, (k, v)| r.tap {r[k] = (v.is_a?(Array) ? v.join(',') : v)}}
      RestClient.get(url, params: params)
    end
  end
end