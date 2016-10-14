require_relative 'base'

class User < Base
  ATTRIBUTES = [
    :ident, :country, :first_name, :last_name, :company, :address1, :address2,
    :city, :state, :zip, :phone_number, :cell_number, :email, :password,
    :retype_password, :date_of_birth, :terms
  ].freeze

  attr_accessor(*ATTRIBUTES)

  def self.default
    where(email: Howitzer.app_test_user).first
  end

  def attributes
    ATTRIBUTES.zip(ATTRIBUTES.map(&method(:public_send))).to_h
  end
end
