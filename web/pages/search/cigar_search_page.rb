require_relative 'base_page'
class CigarSearchPage < BasePage
  path '/cigar-search'

  validate :url, /\/cigar-search(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Cigar Search | Famous Smoke')}$/
end
