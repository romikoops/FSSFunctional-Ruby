require_relative 'base_page'
class PremiumCigarSamplersPage < BasePage
  path '/cigars/premium-cigar-samplers'

  validate :url, %r{/cigars/premium-cigar-samplers(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Premium Cigar Samplers | Famous Smoke')}$/
end
