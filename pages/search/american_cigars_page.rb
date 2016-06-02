class AmericanCigarsPage < BasePage
  url '/cigars/american-cigars'

  validate :url, pattern: /\/cigars\/american-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('American Cigars | Famous Smoke')}$/
end