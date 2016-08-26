class WebPage
  ABSTRACT_PAGES = %w{BasePage}
  def self.inherited(subclass)
    subclass.class_eval { include Singleton }
    Howitzer::Utils::PageValidator.pages << subclass unless ABSTRACT_PAGES.include?(subclass.name)
  end
end