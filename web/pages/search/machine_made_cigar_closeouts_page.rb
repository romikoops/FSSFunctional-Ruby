require_relative 'base_page'
class MachineMadeCigarCloseoutsPage < BasePage
  path '/cigars/machine-made-cigar-closeouts'

  validate :url, %r{/cigars/machine-made-cigar-closeouts(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Machine Made Cigar Closeouts | Famous Smoke')}$/
end
