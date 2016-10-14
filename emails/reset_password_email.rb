require_relative 'base_email'

class ResetPasswordEmail < BaseEmail
  subject 'Your :app_host password has been reset.'
  add_anchor 'Forgot your password? Oops.'
  add_anchor "No biggie - we're giving you a new one, so you can log in and get back to shopping."
  add_anchor "After all, it's not like you forgot Mother's Day."
  add_anchor 'Unless "mothersday" was your password - In which case, good luck with that.'
  add_anchor /Your password for [\w\.+-]+@[\w\.+-]+ has been reset./
  add_anchor 'Now go and reset it with something memorable, following these easy steps:'
  add_anchor '1. Click on the link below'
  add_anchor '2. When the web page is displayed, enter your new password twice.'
  add_anchor '3. Click on the Submit button.'
  add_anchor 'NOTE: Password must be 6 to 15 characters, have one number, one letter, and no spaces.'
  add_anchor %r{https?://[^/]+/update-password/[^/">\s]+}

  def reset_password_link
    text[%r{https?://[^/]+/update-password/[^/">\s]+}]
  end

  def token
    reset_password_link[%r{update-password/(.+)}, 1]
  end

  def reset_password
    UpdatePasswordPage.open(token: token)
    Capybara.screenshot_and_open_image
  end
end
