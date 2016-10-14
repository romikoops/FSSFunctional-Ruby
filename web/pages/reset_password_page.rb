class ResetPasswordPage < Howitzer::Web::Page
  path '/reset-password'

  validate :url, %r{\/reset-password$}
  validate :title, /^Reset Password \| Famous Smoke$/

  section :header
  section :email_modal_blocker

  element :email_field,   '#email'
  element :submit_button, '.newbtn.forgotten'
  element :error_message, '.logpage h3'

  def error_messages
    error_message_elements.map { |e| e.text.strip }
  end

  def fill_form(fields)
    Howitzer::Log.info "Fill Reset Password form with following data: #{fields}"
    email_field_element.set(fields[:email]) if fields[:email]
    self
  end

  def submit_form
    Howitzer::Log.info 'Submit Reset Password form'
    submit_button_element.click
  end
end
