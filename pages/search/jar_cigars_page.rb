require_relative 'base_page'
class JarCigarsPage < BasePage
  path '/cigars/jar-cigars'

  validate :url, /\/cigars\/jar-cigars(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Cigar Jars | Famous Smoke')}$/
end
