require_relative 'base_page'
class NicaraguanCigarsPage < BasePage
  path '/cigars/nicaraguan-cigars'

  validate :url, %r{/cigars/nicaraguan-cigars(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Nicaraguan Cigars | Famous Smoke')}$/
end
