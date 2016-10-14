require_relative 'base_page'
class FullBodiedCigarsPage < BasePage
  path '/cigars/full-bodied-cigars'

  validate :url, %r{/cigars/full-bodied-cigars(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Full Bodied Cigars | Famous Smoke')}$/
end
