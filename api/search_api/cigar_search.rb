# SearchApi::CigarSearch class is class which provide methods to communicate with site api
class SearchApi::CigarSearch
  DEFAULT_FILTER_SET = 'cigar-search'.freeze

  class << self
    include SearchApi::Helpers

    def default_filters
      { json: true, results_per_page: 60, sort: 'best_desc', min_qty_in_stock: 1, max_qty_in_stock: 10_000 }
    end

    # send GET request to site api and parse responce
    def search(filters = {})
      get(search_url, default_filters.merge(filters))
    end

    # gets selected filters for given filter set(default filter set is 'cigar-search')
    def selected_filters(filter_set = DEFAULT_FILTER_SET)
      get(api_url(filter_set), json: true, filters_only: true).selected_filters.symbolize_keys
    end

    # gets all available filters for given filter set(default filter set is 'cigar-search')
    def available_filters(filter_set = DEFAULT_FILTER_SET)
      get(api_url(filter_set), json: true, filters_only: true).filters
    end

    # finds filter by readable title in filter groun in filter_set(default filter set is 'cigar-search')
    def filter_by_title_from_group(filter_set = DEFAULT_FILTER_SET, group, title)
      get(api_url(filter_set), json: true, filters_only: true).filter_by_title_from_group(group, title)
    end

    # gets all available filter keys in given filter group in filter_set(default filter set is 'cigar-search')
    def filter_names_from_group(filter_set = DEFAULT_FILTER_SET, group)
      get(api_url(filter_set), json: true, filters_only: true).filter_names_from_group(group)
    end

    private

    def api_url(type)
      "#{Howitzer.api_protocol}://#{Howitzer.app_host}/#{type}"
    end

    def search_url
      api_url(DEFAULT_FILTER_SET)
    end

    # sends GET request to given url with given params
    def get(base_url = search_url, params = {})
      url = "#{base_url}?#{hash_to_params(params)}" # adds params to url
      # get - sends GET request to API and returns JSON responce and creating object from responce
      SearchApi::Result.new(RestClient::Request.execute(method: :get, url: url, verify_ssl: false))
    end
  end
end
