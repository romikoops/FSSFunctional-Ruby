# SearchApi::CigarSearch class is class which provide methods to communicate with site api
class SearchApi::CigarSearch
  DEFAULT_FILTER_SET = 'cigar-search'

  class << self
    include SearchApi::Helpers

    # send GET request to site api and parse responce
    def search(filters={})
      # get - sends GET request to API and returns JSON responce
      responce = get(search_url, default_filters.merge(filters))
      # creating object from responce
      SearchApi::Result.new(responce)
    end

    # gets selected filters for given filter set(default filter set is 'cigar-search')
    def selected_filters(filter_set=DEFAULT_FILTER_SET)
      responce = get(api_url(filter_set), json: true, filters_only: true)
      SearchApi::Result.new(responce).selected_filters.symbolize_keys
    end

    # gets all available filters for given filter set(default filter set is 'cigar-search')
    def available_filters(filter_set=DEFAULT_FILTER_SET)
      responce = get(api_url(filter_set), json: true, filters_only: true)
      SearchApi::Result.new(responce).filters
    end

    # finds filter by readable title in filter groun in filter_set(default filter set is 'cigar-search')
    def filter_by_title_from_group(filter_set=DEFAULT_FILTER_SET, group, title)
      filter = available_filters(filter_set)
          .find { |f| f[:title].to_s.strip.downcase == group.downcase }[:filters]
          .find { |f| f[:title].to_s.strip.downcase == sanitize_filter_label(title).downcase }

      { filter[:key].to_sym => filter[:value].to_s.strip }
    end

    # gets all available filter keys in given filter group in filter_set(default filter set is 'cigar-search')
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

    # sends GET request to given url with given params
    def get(base_url=search_url, params={})
      url = "#{base_url}?#{hash_to_params(params)}" # adds params to url
      RestClient.get(url)
    end
  end
end