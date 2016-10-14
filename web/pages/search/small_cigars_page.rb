require_relative 'base_page'
class SmallCigarsPage < BasePage
  path '/cigars/small-cigars'

  validate :url, %r{/cigars/small-cigars(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Small Cigars | Famous Smoke')}$/
end
