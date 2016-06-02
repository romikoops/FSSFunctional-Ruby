class PremiumCigarsPage < BasePage
  url '/cigars/premium-cigars'

  validate :url, pattern: /\/cigars\/premium-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Premium Cigars | Famous Smoke')}$/
end