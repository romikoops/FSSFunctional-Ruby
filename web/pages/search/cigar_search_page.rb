require_relative 'base_page'
class CigarSearchPage < BasePage
  path '/cigar-search'

  validate :url, %r{/cigar-search(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Cigar Search | Famous Smoke')}$/
end
