require_relative 'base_page'
class CigarillosCigarsPage < BasePage
  path '/cigars/cigarillos-cigars'

  validate :url, %r{/cigars/cigarillos-cigars(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Cigarillos Cigars for Sale | Famous Smoke')}$/
end
