class MachineMadeCigarsPage < BasePage
  url '/cigars/machine-made-cigars'

  validate :url, pattern: /\/cigars\/machine-made-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Machine Made Cigars & Cigarillos for Sale | Famous Smoke')}$/
end