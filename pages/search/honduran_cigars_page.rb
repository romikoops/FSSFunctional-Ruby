class HonduranCigarsPage < BasePage
  url '/cigars/honduran-cigars'

  validate :url, pattern: /\/cigars\/honduran-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Honduran Cigars | Famous Smoke')}$/
end