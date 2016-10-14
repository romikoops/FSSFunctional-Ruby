class HeaderSection < Howitzer::Web::Section
  me '.pagebar'

  element :account_menu_expander, '.account:not(.hover)'
  element :account_menu_collapser, '.account.hover'
  element :account_menu_item, '.accountlinks a'
  element :account_menu_link, :xpath, ->(t) { "//*[contains(@class,'topmenu')]//a[normalize-space()='#{t}']" }

  def account_menu_links
    account_menu_item_elements.map { |e| e.text.strip }
  end

  def expand_account_menu
    Howitzer.tries_big.times do
      sleep 1
      account_menu_expander_element.click if has_account_menu_expander_element?
    end
    execute_script "$('#{locator :account_menu_expander}').click();"
    self
  end

  def collapse_account_menu
    execute_script "$('#{locator :account_menu_collapser}').click();"
  end

  def click_account_link(text)
    account_menu_link_element(text).click
  end
end
