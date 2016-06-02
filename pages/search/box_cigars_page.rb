class BoxCigarsPage < BasePage
  url '/cigars/box-cigars'

  validate :url, pattern: /\/cigars\/box-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Box of Cigars: Box Selections Starting Under $20 | Famous Smoke')}$/
end