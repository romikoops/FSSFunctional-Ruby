require_relative 'base_page'
class PremiumCigarsPage < BasePage
  path '/cigars/premium-cigars'

  validate :url, /\/cigars\/premium-cigars(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Premium Cigars | Famous Smoke')}$/
end
