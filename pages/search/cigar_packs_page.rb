class CigarPacksPage < BasePage
  url '/cigars/cigar-packs'

  validate :url, pattern: /\/cigars\/cigar-packs(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigar Packs | Famous Smoke')}$/
end