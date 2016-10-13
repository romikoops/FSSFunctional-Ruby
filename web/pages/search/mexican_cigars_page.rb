require_relative 'base_page'
class MexicanCigarsPage < BasePage
  path '/cigars/mexican-cigars'

  validate :url, /\/cigars\/mexican-cigars(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Mexican Cigars | Famous Smoke')}$/
end
