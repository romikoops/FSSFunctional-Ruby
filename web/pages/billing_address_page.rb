class BillingAddressPage < Howitzer::Web::Page
  path '/account/billing-address'

  validate :url, %r{/account/billing-address}
  validate :title, /^Billing Address \| Famous Smoke$/

  section :header
  section :email_modal_blocker

  def fill_form(fields)
    Howitzer::Log.info "Fill Billing Address form with following data: #{fields}"
    raise 'Not implemented yet'
  end

  def submit_form
    Howitzer::Log.info 'Submit Billing Address form'
    raise 'Not implemented yet'
  end
end
