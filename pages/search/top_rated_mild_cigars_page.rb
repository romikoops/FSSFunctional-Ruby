class TopRatedMildCigarsPage < BasePage
  url '/cigars/top-rated-mild-cigars'

  validate :url, pattern: /\/cigars\/top-rated-mild-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Top Rated Mild Cigars | Famous Smoke')}$/
end