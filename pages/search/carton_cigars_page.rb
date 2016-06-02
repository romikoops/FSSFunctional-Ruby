class CartonCigarsPage < BasePage
  url '/cigars/carton-cigars'

  validate :url, pattern: /\/cigars\/carton-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigars in Cartons | Famous Smoke')}$/
end