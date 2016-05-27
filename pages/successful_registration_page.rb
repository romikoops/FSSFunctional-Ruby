class SuccessfulRegistrationPage < WebPage
  url '/register?registrationSuccessful'

  validate :url, pattern: /\/register\?registrationSuccessful$/
end