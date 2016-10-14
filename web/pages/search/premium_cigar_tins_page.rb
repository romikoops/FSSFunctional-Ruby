require_relative 'base_page'
class PremiumCigarTinsPage < BasePage
  path '/cigars/premium-cigar-tins'

  validate :url, %r{/cigars/premium-cigar-tins(?:\?.*|)$}
  validate :title, /^#{Regexp.escape('Premium Cigar Tins | Famous Smoke')}$/
end
