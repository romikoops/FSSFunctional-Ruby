require_relative 'base_page'
class AmericanCigarsPage < BasePage
  path '/cigars/american-cigars'

  validate :url, /\/cigars\/american-cigars(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('American Cigars | Famous Smoke')}$/
end
