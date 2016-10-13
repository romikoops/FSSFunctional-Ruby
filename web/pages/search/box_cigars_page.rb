require_relative 'base_page'
class BoxCigarsPage < BasePage
  path '/cigars/box-cigars'

  validate :url, /\/cigars\/box-cigars(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Box of Cigars: Box Selections Starting Under $20 | Famous Smoke')}$/
end
