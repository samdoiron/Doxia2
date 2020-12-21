class PagesShowPresenter
  def initialize(page_record)
    @page_record = page_record
  end

  delegate :title, to: :@page_record
end
