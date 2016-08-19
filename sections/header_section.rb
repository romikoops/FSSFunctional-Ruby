module HeaderSection
  def self.included(base)
    base.class_eval do
      add_locator :account_menu_expander, '.pagebar a.account'
      add_locator :expanded_account_menu, '.pagebar a.account.hover'
      add_locator :account_menu_items, '.pagebar .accountlinks a'
      add_locator :account_menu_link, ->(t) { {xpath: "//*[contains(@class,'topmenu')]//a[normalize-space()='#{t}']"} }
    end
  end

  def account_menu_links
    all(locator :account_menu_items).map { |e| e.text.strip }
  end

  def account_menu_expanded?
    first(locator :expanded_account_menu).present?
  end

  def expand_account_menu
    find(locator :account_menu_expander).click unless account_menu_expanded?
    self
  end

  def collapse_account_menu
    find(locator :account_menu_expander).click if account_menu_expanded?
  end

  def click_account_link(text)
    find(apply(locator(:account_menu_link), text)).click
  end
end