class MachineMadeCigarCloseoutsPage < BasePage
  url '/cigars/machine-made-cigar-closeouts'

  validate :url, pattern: /\/cigars\/machine-made-cigar-closeouts(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Machine Made Cigar Closeouts | Famous Smoke')}$/
end