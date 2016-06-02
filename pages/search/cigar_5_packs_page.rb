class Cigar5PacksPage < BasePage
  url '/cigars/cigar-5-packs'

  validate :url, pattern: /\/cigars\/cigar-5-packs(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigar 5-Packs | Famous Smoke')}$/
end