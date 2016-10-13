class SuccessfulRegistrationPage < Howitzer::Web::Page
  path '/register?registrationSuccessful'

  validate :url, /\/register\?registrationSuccessful$/

  section :header
end
