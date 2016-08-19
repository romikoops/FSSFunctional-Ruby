class BillingAddressPage < WebPage
  include HeaderSection
  include EmailModalBlockerSection

  url '/account/billing-address'

  validate :url, pattern: /\/account\/billing-address/
  validate :title, pattern: /^Billing Address \| Famous Smoke$/

  def fill_form(fields)
    log.info "Fill Billing Address form with following data: #{fields}"
    raise 'Not implemented yet'
  end

  def submit_form
    log.info 'Submit Billing Address form'
    raise 'Not implemented yet'
  end
end