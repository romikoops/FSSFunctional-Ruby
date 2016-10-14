require_relative 'base_page'
class CigarPacksPage < BasePage
  path '/cigars/cigar-packs'

  validate :url, %r{/cigars/cigar-packs(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Cigar Packs | Famous Smoke')}$/
end
