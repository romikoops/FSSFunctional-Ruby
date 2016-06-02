class TopRatedPairingCigarSamplersPage < BasePage
  url '/cigars/top-rated-pairing-cigar-samplers'

  validate :url, pattern: /\/cigars\/top-rated-pairing-cigar-samplers(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Top Rated Pairing Cigar Samplers | Famous Smoke')}$/
end