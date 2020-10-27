class PagesIndexPresenter
  class PageItem
    def initialize(page)
      @page = page
    end

    def path
      UrlHelpers.page_path(page.id)
    end

    def title
      page.title
    end
  end

  def initialize(given_pages)
    @given_pages = given_pages
  end

  def pages
    @pages ||= given_pages.map(&PageItem.method(:new))
  end

  private

  attr_reader :given_pages
end
