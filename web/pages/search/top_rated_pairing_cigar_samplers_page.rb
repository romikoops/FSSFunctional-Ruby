require_relative 'base_page'
class TopRatedPairingCigarSamplersPage < BasePage
  path '/cigars/top-rated-pairing-cigar-samplers'

  validate :url, /\/cigars\/top-rated-pairing-cigar-samplers(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Top Rated Pairing Cigar Samplers | Famous Smoke')}$/
end
