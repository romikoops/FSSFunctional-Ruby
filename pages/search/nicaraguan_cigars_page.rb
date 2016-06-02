class NicaraguanCigarsPage < BasePage
  url '/cigars/nicaraguan-cigars'

  validate :url, pattern: /\/cigars\/nicaraguan-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Nicaraguan Cigars | Famous Smoke')}$/
end