require_relative 'base_page'
class SingleCigarsPage < BasePage
  path '/cigars/single-cigars'

  validate :url, %r{/cigars/single-cigars(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Single Cigars | Famous Smoke')}$/
end
