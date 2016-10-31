class CardExpirationPage < Howitzer::Web::Page
  validate :element_presence, :card_expiration

  element :expiration_date,       '#expiration'

  def self.expiration_date
    given.expiration_date_element
  end

  def fill_expiration_date(value)
    expiration_date_element.set(value)
  end
end
