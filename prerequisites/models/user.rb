# For more information about configuration please refer to https://github.com/remiprev/her
class User
  include Her::Model

  COUNTRY = 'USA'
  STATES = %w(AA AE AK AL AP AR AS AZ CA CO CT DC DE FL FM GA GU HI IA ID IL IN KS KY LA MA MD ME MH MI MN
              MO MP MS MT NC ND NE NH NJ NM NV NY OH OK OR PA PR PW RI SC SD TN TX UT VA VI VT WA WI WV WY)

  include_root_in_json true
  parse_root_in_json true, format: :active_model_serializers
end