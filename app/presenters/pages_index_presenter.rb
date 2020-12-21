class PagesIndexPresenter
  class PageItem
    def initialize(record)
      @record = record
    end

    def path
      UrlHelpers.page_path(@record.handle)
    end

    def title
      @record.title + " And now more"
    end
    #delegate :title, to: :@record
  end

  def initialize(page_records)
    @page_records = page_records
  end

  def create_new_page_path
    UrlHelpers.new_page_path
  end

  def pages
    @page_records.map { |record| PageItem.new(record) }
  end
end
