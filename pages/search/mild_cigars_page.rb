class MildCigarsPage < BasePage
  url '/cigars/mild-cigars'

  validate :url, pattern: /\/cigars\/mild-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Mild Cigars | Famous Smoke')}$/
end