require_relative 'base_page'
class MildCigarsPage < BasePage
  path '/cigars/mild-cigars'

  validate :url, /\/cigars\/mild-cigars(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Mild Cigars | Famous Smoke')}$/
end
