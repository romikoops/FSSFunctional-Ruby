class SearchApi::CigarSearch
  DEFAULT_FILTER_SET = 'cigar-search'

  class << self
    include SearchApi::Helpers

    def search(filters={})
      responce = get(search_url, merge_filters(default_filters, filters))
      SearchApi::Result.new(responce)
    end

    def selected_filters(filter_set=DEFAULT_FILTER_SET)
      responce = get(api_url(filter_set), json: true, filters_only: true)
      SearchApi::Result.new(responce).selected_filters.symbolize_keys
    end

    def available_filters(filter_set=DEFAULT_FILTER_SET)
      responce = get(api_url(filter_set), json: true, filters_only: true)
      SearchApi::Result.new(responce).filters
    end

    def filter_by_title_from_group(filter_set=DEFAULT_FILTER_SET, group, title)
      filter = available_filters(filter_set)
          .find { |f| f[:title].to_s.strip.downcase == group.downcase }[:filters]
          .find { |f| f[:title].to_s.strip.downcase == sanitize_filter_label(title).downcase }

      { filter[:key].to_sym => filter[:value].to_s.strip }
    end

    def filter_names_by_group(filter_set=DEFAULT_FILTER_SET, group)
      available_filters(filter_set)
          .find { |f| f[:title].to_s.strip.downcase == group.downcase}[:filters]
          .map { |f| f[:key].to_sym }
    end

    def default_filters
      { json: true, results_per_page: 60, sort: 'best_desc' }
    end

    private

    def api_url(type)
      "http://#{settings.app_host}/#{type}"
    end

    def search_url
      api_url(DEFAULT_FILTER_SET)
    end

    def get(base_url=search_url, params={})
      url = "#{base_url}?#{hash_to_params(params)}"
      # params = params.inject({}) {|r, (k, v)| r.tap {r[k] = (v.is_a?(Array) ? v.join(',') : v)}}
      # log.info "Getting url #{url}"
      RestClient.get(url)
    end
  end
end