class ProductPage < WebPage
  include HeaderSection
  include EmailModalBlockerSection

  url '{product_url}'

  validate :url, pattern: /#{Regexp.escape(app_url)}\/[^\/]+\/item\+\d+$/

  add_locator :add_to_cart_button, ':checked+.ic a[href*=add-to-cart]'

  def self.open(params)
    url = params.inject(@url_template) {|r, (k, v)| r.gsub(/\{#{k}\}/, v) }
    url = "#{app_url}#{url}"

    log.info "Open #{name} page by '#{url}' url"
    retryable(tries: 2, logger: log, trace: true, on: Exception) do |retries|
      log.info 'Retry...' unless retries.zero?
      visit url
    end
    given
  end

  def add_to_cart
    find(locator :add_to_cart_button).click
  end
end