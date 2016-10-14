require_relative 'base_page'
class CartonCigarsPage < BasePage
  path '/cigars/carton-cigars'

  validate :url, %r{/cigars/carton-cigars(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Cigars in Cartons | Famous Smoke')}$/
end
