class MexicanCigarsPage < BasePage
  url '/cigars/mexican-cigars'

  validate :url, pattern: /\/cigars\/mexican-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Mexican Cigars | Famous Smoke')}$/
end