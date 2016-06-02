class Cigar10PacksPage < BasePage
  url '/cigars/cigar-10-packs'

  validate :url, pattern: /\/cigars\/cigar-10-packs(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigar 10-Packs | Famous Smoke')}$/
end