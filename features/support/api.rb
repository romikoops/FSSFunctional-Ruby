require_relative '../../api/search_api'
def api
  SearchApi::CigarSearch
end

RestClient.log = $stdout
