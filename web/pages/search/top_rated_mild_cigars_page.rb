require_relative 'base_page'
class TopRatedMildCigarsPage < BasePage
  path '/cigars/top-rated-mild-cigars'

  validate :url, /\/cigars\/top-rated-mild-cigars(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Top Rated Mild Cigars | Famous Smoke')}$/
end
