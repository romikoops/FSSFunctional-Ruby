require_relative 'base_page'
class BestOfCigarSamplersPage < BasePage
  path '/cigars/best-of-cigar-samplers'

  validate :url, %r{/cigars/best-of-cigar-samplers(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Best Cigar Sampler Deals | Famous Smoke')}$/
end
