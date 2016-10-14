class SuccessfulRegistrationPage < Howitzer::Web::Page
  path '/register?registrationSuccessful'

  validate :url, %r{/register\?registrationSuccessful$}

  section :header
end
