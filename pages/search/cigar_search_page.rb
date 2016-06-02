class CigarSearchPage < BasePage
  url '/cigar-search'

  validate :url, pattern: /\/cigar-search(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigar Search | Famous Smoke')}$/
end