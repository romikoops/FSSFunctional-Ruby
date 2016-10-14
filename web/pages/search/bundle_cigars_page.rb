require_relative 'base_page'
class BundleCigarsPage < BasePage
  path '/cigars/bundle-cigars'

  validate :url, %r{/cigars/bundle-cigars(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Cigars in Bundles for Sale | Famous Smoke')}$/
end
