class CigarSearchPage < BasePage
  url '/cigar-search'

  validate :url, pattern: /\/cigar-search(?:\?.*|)$/
end