class PremiumCigarSamplersPage < BasePage
  url '/cigars/premium-cigar-samplers'

  validate :url, pattern: /\/cigars\/premium-cigar-samplers(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Premium Cigar Samplers | Famous Smoke')}$/
end