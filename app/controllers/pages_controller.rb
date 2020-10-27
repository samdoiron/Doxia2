class PagesController < ApplicationController
  include Import['application']

  def index
    application.transaction do |t|
      pages = t.view_page_index
      render locals: { presenter: PagesIndexPresenter.new(pages) }
    end
  end

  def show
    render plain: 'showing a page'
  end
end
