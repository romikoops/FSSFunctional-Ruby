class SmallCigarsPage < BasePage
  url '/cigars/small-cigars'

  validate :url, pattern: /\/cigars\/small-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Small Cigars | Famous Smoke')}$/
end