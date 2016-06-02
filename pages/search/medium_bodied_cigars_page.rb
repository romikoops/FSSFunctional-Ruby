class MediumBodiedCigarsPage < BasePage
  url '/cigars/medium-bodied-cigars'

  validate :url, pattern: /\/cigars\/medium-bodied-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Medium Bodied Cigars | Famous Smoke')}$/
end