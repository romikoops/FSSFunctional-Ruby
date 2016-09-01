# For more information about configuration please refer to https://github.com/remiprev/her
class User
  include Her::Model
  TITLES = %w(Mr Ms Mrs Miss Dr)

  COUNTRIES = %w(ARGENTINA BELARUS CAMBODIA DENMARK ENGLAND FIJI GABON HAITI
               ICELAND JAMAICA KAMPUCHEA LAO MACAU NAMIBIA OMAN PAKISTAN
               QATAR SAMOA TAIWAN USA VIETNAM YEMEN ZAMBIA)

  include_root_in_json true
  parse_root_in_json true, format: :active_model_serializers
end