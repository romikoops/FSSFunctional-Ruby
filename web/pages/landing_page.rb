class LandingPage < Howitzer::Web::Page
  path '/'

  validate :title, /^Buy Cigars: The Best Cigars Online at Low Prices \| Famous Smoke$/

  section :header
  section :email_modal_blocker
end
