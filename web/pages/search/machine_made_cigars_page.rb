require_relative 'base_page'
class MachineMadeCigarsPage < BasePage
  path '/cigars/machine-made-cigars'

  validate :url, %r{/cigars/machine-made-cigars(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Machine Made Cigars & Cigarillos for Sale | Famous Smoke')}$/
end
