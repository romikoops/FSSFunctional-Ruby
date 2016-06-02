class LiquidationCigarSamplersPage < BasePage
  url '/cigars/liquidation-cigar-samplers'

  validate :url, pattern: /\/cigars\/liquidation-cigar-samplers(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigar Sampler Liquidation | Famous Smoke')}$/
end