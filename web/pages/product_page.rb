class ProductPage < Howitzer::Web::Page
  path '{product_url}'

  validate :url, %r{#{Regexp.escape(Howitzer.app_uri.site)}/[^/]+/item\+\d+$}

  section :header
  section :email_modal_blocker
end
