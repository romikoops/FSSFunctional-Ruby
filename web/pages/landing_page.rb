class LandingPage < Howitzer::Web::Page
  path '/'

  validate :title, /^Buy Cigars: The Best Cigars Online at Low Prices \| Famous Smoke$/

  section :header
  section :email_modal_blocker

  element :department, :xpath, "//*[@class='arrow arrowdown whitearrow']"
  element :gifts, :xpath, ->(el) { "//ul[@data-section='#{el}']/.." }
  element :dropdown_item,   :xpath, ->(el) { "//a[text()='#{el}']" }
  element :advertisement,   :xpath, "//span[text()='X']"
  element :first_item_grid, 'a.dealitembox', match: :first
  element :offer,           '.dealsku'
  element :item_grid,       :xpath, ->(el) { "(.//*[@class='dealsku'])[#{el}]" }
  element :add_to_cart,     :xpath, "//a[text()='add to cart']"
  element :ssl_certificate, '#a2apage_show_more_less' #'.norton>table>tbody>tr>td>a'
  element :item_details,    :xpath, "//a[text()='see item details']"
  element :first_quickview, '.hoveritem.oswald', match: :first
  element :first_item_name, '.dealitembrand', match: :first
  element :cigars_menu,     :xpath,  "//li[@data-submenu='cigars']//li[*[normalize-space(.)='New']]"
  element :preorder,        :xpath,  "//a[text()='Preorder']"
  element :preorder_button, '.basic-button.oswald.cartbtn.yellowwhite'
  element :na_item,         :xpath, "//div[text()='Item not available']"
  element :close_details,   '.closedetails'
  element :bonus_item,      '.subtitle.cblack.oswald.tac'
  element :add_bonus,       :xpath, "//div[text()='add to cart']"
  element :buy_offer_button, '.buy-button>img'
  element :add_offer, '.basic-button.oswald.cartbtn.yellowblack'
  element :my_cart,          :xpath,  "//*[@class='desktop-inline'][contains(.,'cart')]"
  element :item_is_added,    :xpath,  "//*[@class='cart_title'][contains(.,'added to cart')]"

  def dropdown_menu(el)
    if has_advertisement_element?
      advertisement_element.click
    end
    department_element.hover
    gifts_element(el).hover
  end

  def dropdown_element_click(el)
    dropdown_item_element(el).click
  end

  def add_to_cart
    has_item_details_element?(visible: true)
    add_to_cart_element.click
    unless has_item_is_added_element?
      if has_na_item_element?(visible: true) # if item is not available should go to next item in list
        close_details_element.click
        iteration_number = Howitzer::Cache.extract(:present, :item)
        add_item(iteration_number + 1)
      end
    end
  end

  def add_first_giftcard
    dropdown_item_element('Gift Cards').click
    add_item(1)
  end

  def add_first_giftset
    dropdown_item_element('Gift Sets').click
    add_item(1)
  end

  def add_first_accessories
    dropdown_item_element('Miscellaneous').click
    add_item(1)
  end

  def add_item(number)
    Howitzer::Cache.store(:present, :item, number)
    has_ssl_certificate_element?(present: true)
    # has_first_item_name_element?(visible: true)
    item_grid_element(number).hover
    first_quickview_element.click
    add_to_cart
  end

  def add_bonus_if_present
    return unless has_bonus_item_element?(visible: true)
    add_bonus_element.click
  end

  def preordef_first_item
    has_first_item_name_element?(visible: true)
    first_item_grid_element.hover
    first_quickview_element.click
    preorder_button_element.click
  end

  def preorder_cigars
    cigars_menu_element.hover
    preorder_element.click
    preordef_first_item
  end

  def add_free_shipping_item
    dropdown_item_element('Free Shipping').click
    add_item(1)
    add_bonus_if_present
  end

  def buy_offer
    dropdown_item_element('Offers').click
    has_offer_element?(visible: true)
    offer_elements.last.click
    buy_offer_button_element.click
    advertisement_element.click
    add_offer_element.click
  end

  def add_free_item
    dropdown_item_element('Free Stuff').click
    add_item(1)
  end

  def visit_my_cart
    advertisement_element.click
    my_cart_element.click
  end
end
