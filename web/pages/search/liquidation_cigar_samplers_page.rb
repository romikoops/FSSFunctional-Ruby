require_relative 'base_page'
class LiquidationCigarSamplersPage < BasePage
  path '/cigars/liquidation-cigar-samplers'

  validate :url, /\/cigars\/liquidation-cigar-samplers(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Cigar Sampler Liquidation | Famous Smoke')}$/
end
