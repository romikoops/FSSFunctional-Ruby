require_relative 'base_page'
class HonduranCigarsPage < BasePage
  path '/cigars/honduran-cigars'

  validate :url, /\/cigars\/honduran-cigars(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Honduran Cigars | Famous Smoke')}$/
end
