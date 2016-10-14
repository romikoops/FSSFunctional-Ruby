require_relative 'base_page'
class LiquidationCigarSamplersPage < BasePage
  path '/cigars/liquidation-cigar-samplers'

  validate :url, %r{/cigars/liquidation-cigar-samplers(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Cigar Sampler Liquidation | Famous Smoke')}$/
end
