class BundleCigarsPage < BasePage
  url '/cigars/bundle-cigars'

  validate :url, pattern: /\/cigars\/bundle-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigars in Bundles for Sale | Famous Smoke')}$/
end