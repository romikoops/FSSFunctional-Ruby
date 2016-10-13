require_relative 'base_page'
class Cigar10PacksPage < BasePage
  path '/cigars/cigar-10-packs'

  validate :url, /\/cigars\/cigar-10-packs(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Cigar 10-Packs | Famous Smoke')}$/
end
