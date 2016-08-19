module HeaderSection
  def self.included(base)
    base.class_eval do
      add_locator :account_menu_expander, '.pagebar .account:not(.hover)'
      add_locator :account_menu_collapser, '.pagebar .account.hover'
      add_locator :account_menu_items, '.pagebar .accountlinks a'
      add_locator :account_menu_link, ->(t) { {xpath: "//*[contains(@class,'topmenu')]//a[normalize-space()='#{t}']"} }
    end
  end

  def account_menu_links
    all(locator :account_menu_items).map { |e| e.text.strip }
  end

  def expand_account_menu
    settings.tries_big.times do
      sleep settings.timeout_tiny
      find(locator :account_menu_expander).click if first(locator :account_menu_expander)
    end
    execute_script "$('#{locator :account_menu_expander}').click();"
    self
  end

  def collapse_account_menu
    execute_script "$('#{locator :account_menu_collapser}').click();"
  end

  def click_account_link(text)
    find(apply(locator(:account_menu_link), text)).click
  end
end