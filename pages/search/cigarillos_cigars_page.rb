class CigarillosCigarsPage < BasePage
  url '/cigars/cigarillos-cigars'

  validate :url, pattern: /\/cigars\/cigarillos-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigarillos Cigars for Sale | Famous Smoke')}$/
end