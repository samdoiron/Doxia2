class PagesIndexPresenter
  Item = Struct.new(:id, :title, keyword_init: true)
  class PageItem

    def initialize(id:, title:)
      @id = id
      @title = title
    end

    def path
      UrlHelpers.page_path(id)
    end

    attr_reader :title

    private

    attr_reader :id
  end

  def pages
    [
      PageItem.new(id: 'hello-world', title: 'Hello World'),
        PageItem.new(id: 'goodbye-world', title: 'Goodbye World')
    ]
  end
end
