require_relative 'base_page'
class HonduranCigarsPage < BasePage
  path '/cigars/honduran-cigars'

  validate :url, %r{/cigars/honduran-cigars(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Honduran Cigars | Famous Smoke')}$/
end
