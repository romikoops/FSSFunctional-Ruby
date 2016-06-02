class BestOfCigarSamplersPage < BasePage
  url '/cigars/best-of-cigar-samplers'

  validate :url, pattern: /\/cigars\/best-of-cigar-samplers(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Best Cigar Sampler Deals | Famous Smoke')}$/
end