class LandingPage < Howitzer::Web::Page
  path '/'

  validate :title, /^Buy Cigars: The Best Cigars Online at Low Prices \| Famous Smoke$/

  section :header
  section :email_modal_blocker

  element :department,      :xpath, "//*[@class='arrow arrowdown whitearrow']"
  element :gifts, :xpath, ->(el) { "//*[@href='https://newdev2.famous-smoke.com/#{el}']" }
  element :dropdown_item,   :xpath, ->(el) { "//a[text()='#{el}']" }
  element :advertisement,   :xpath,  "//span[text()='X']"
  element :first_item_grid, "a.dealitembox", match: :first
  element :add_to_cart,     :xpath,  "//a[text()='add to cart']"
  element :social_tabs,     :xpath,  "//*[@class='socialbox inlineblock right topgap']"
  element :item_details,    :xpath,  "//a[text()='see item details']"
  element :first_quickview, ".hoveritem.oswald", match: :first
  element :first_item_name, '.dealitembrand', match: :first
  element :cigars_menu,    :xpath,  "//li[@data-submenu='cigars']//li[*[normalize-space(.)='New']]"
  element :preorder,        :xpath,  "//a[text()='Preorder']"
  element :preorder_button, '.basic-button.oswald.cartbtn.yellowwhite'

  def dropdown_menue(el)
    advertisement_element.click
    department_element.hover
    gifts_element(el).hover
  end

  def dropdown_element_click(el)
    dropdown_item_element(el).click
  end

  def add_to_cart
    has_item_details_element?(visible: true)
    add_to_cart_element.click
  end

  def add_first_giftcard
    dropdown_item_element('Gift Cards').click
    add_first_item
  end

  def add_first_giftset
    dropdown_item_element('Gift Sets').click
    add_first_item
  end

  def add_first_accessories
    dropdown_item_element('Miscellaneous').click
    add_first_item
  end

  def add_first_item
    has_first_item_name_element?(visible: true)
    first_item_grid_element.hover
    first_quickview_element.click
    add_to_cart
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
end
