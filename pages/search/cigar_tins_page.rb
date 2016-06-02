class CigarTinsPage < BasePage
  url '/cigars/cigar-tins'

  validate :url, pattern: /\/cigars\/cigar-tins(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigar Tins | Famous Smoke')}$/
end