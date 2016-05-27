class AmericanCigarsPage < BasePage
  url '/cigars/american-cigars'

  validate :url, pattern: /\/cigars\/american-cigars(?:\?.*|)$/
  validate :title, pattern: /^American Cigars \| Famous Smoke$/
end