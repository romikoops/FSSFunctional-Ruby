require_relative 'base_page'
class DominicanCigarsPage < BasePage
  path '/cigars/dominican-cigars'

  validate :url, /\/cigars\/dominican-cigars(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Dominican Cigars | Famous Smoke')}$/
end
