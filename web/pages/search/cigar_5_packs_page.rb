require_relative 'base_page'
class Cigar5PacksPage < BasePage
  path '/cigars/cigar-5-packs'

  validate :url, /\/cigars\/cigar-5-packs(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Cigar 5-Packs | Famous Smoke')}$/
end
