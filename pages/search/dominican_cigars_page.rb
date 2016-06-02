class DominicanCigarsPage < BasePage
  url '/cigars/dominican-cigars'

  validate :url, pattern: /\/cigars\/dominican-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Dominican Cigars | Famous Smoke')}$/
end