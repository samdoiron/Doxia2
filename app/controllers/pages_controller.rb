class PagesController < ApplicationController
  include Core
  include Import["application"]

  def index
    application.transaction do |app|
      pages = app.view_page_index
      render locals: { presenter: PagesIndexPresenter.new(pages) }
    end
  end

  def show
    render
  end
end
