class CardNumberPage < Howitzer::Web::Page
  validate :element_presence, :card_number

  element :card_number,           :xpath, ".//*[@id='credit-card-number']"

  def self.card_number
    given.card_number_element
  end

  def fill_card_number(value)
    card_number_element.set(value)
  end
end
