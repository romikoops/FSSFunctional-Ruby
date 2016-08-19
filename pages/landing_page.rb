class LandingPage < WebPage
  include HeaderSection
  include EmailModalBlockerSection

  url '/'

  validate :url, pattern: /#{Regexp.escape(self.app_url)}\/?$/
  validate :title, pattern: /^Buy Cigars: The Best Cigars Online at Low Prices \| Famous Smoke$/
end