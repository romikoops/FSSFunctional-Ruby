class FullBodiedCigarsPage < BasePage
  url '/cigars/full-bodied-cigars'

  validate :url, pattern: /\/cigars\/full-bodied-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Full Bodied Cigars | Famous Smoke')}$/
end