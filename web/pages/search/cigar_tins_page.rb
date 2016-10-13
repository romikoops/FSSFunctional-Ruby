require_relative 'base_page'
class CigarTinsPage < BasePage
  path '/cigars/cigar-tins'

  validate :url, /\/cigars\/cigar-tins(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Cigar Tins | Famous Smoke')}$/
end
