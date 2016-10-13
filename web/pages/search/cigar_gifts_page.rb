require_relative 'base_page'
class CigarGiftsPage < BasePage
  path '/cigar-gifts'

  validate :url, /\/cigar-gifts(?:\?.*|)$/
  validate :title, /^#{Regexp.escape('Cigar Gifts – Cigar Gift Sets And Gift Baskets | Famous Smoke')}$/
end
