class SingleCigarsPage < BasePage
  url '/cigars/single-cigars'

  validate :url, pattern: /\/cigars\/single-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Single Cigars | Famous Smoke')}$/
end