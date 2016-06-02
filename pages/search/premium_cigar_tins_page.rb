class PremiumCigarTinsPage < BasePage
  url '/cigars/premium-cigar-tins'

  validate :url, pattern: /\/cigars\/premium-cigar-tins(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Premium Cigar Tins | Famous Smoke')}$/
end