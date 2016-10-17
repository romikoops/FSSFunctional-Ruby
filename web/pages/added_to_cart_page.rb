class AddedToCartPage < Howitzer::Web::Page
  validate :url, %r{/added-to-cart}

  section :header
  section :email_modal_blocker
end
