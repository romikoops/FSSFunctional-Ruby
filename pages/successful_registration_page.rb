class SuccessfulRegistrationPage < WebPage
  include HeaderSection

  url '/register?registrationSuccessful'

  validate :url, pattern: /\/register\?registrationSuccessful$/
end