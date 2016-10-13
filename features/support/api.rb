def api
  SearchApi::CigarSearch
end

RestClient.log = $stdout
