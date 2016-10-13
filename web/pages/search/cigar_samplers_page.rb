require_relative 'base_page'
class CigarSamplersPage < BasePage
  path '/cigars/cigar-samplers'

  validate :url, /\/cigars\/cigar-samplers(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Cigar Samplers & Discounts | Famous Smoke')}$/
end
