class CigarSamplersPage < BasePage
  url '/cigars/cigar-samplers'

  validate :url, pattern: /\/cigars\/cigar-samplers(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigar Samplers & Discounts | Famous Smoke')}$/
end