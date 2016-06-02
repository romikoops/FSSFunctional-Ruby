class JarCigarsPage < BasePage
  url '/cigars/jar-cigars'

  validate :url, pattern: /\/cigars\/jar-cigars(?:\?.*|)$/
  validate :title, pattern: /^#{Regexp.escape('Cigar Jars | Famous Smoke')}$/
end