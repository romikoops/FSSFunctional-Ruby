require_relative 'base_page'
class MediumBodiedCigarsPage < BasePage
  path '/cigars/medium-bodied-cigars'

  validate :url, /\/cigars\/medium-bodied-cigars(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Medium Bodied Cigars | Famous Smoke')}$/
end
