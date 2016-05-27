class CigarGiftsPage < BasePage
  url '/cigar-gifts'

  validate :url, pattern: /\/cigar-gifts(?:\?.*|)$/
  validate :title, pattern: /^Cigar Gifts – Cigar Gift Sets And Gift Baskets \| Famous Smoke$/
end