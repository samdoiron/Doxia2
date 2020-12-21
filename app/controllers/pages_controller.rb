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
    page = application.transaction do |app|
      page = app.show_page(params[:id])
      if page.some?
        if stale?(etag: page.value!.title)
          render locals: { presenter: PagesShowPresenter.new(page.value!) }
        end
      else
        not_found
      end
    end
  end

  def new
    render
  end

  def create
    input = params.require([:page, :title])
    application.transaction do |app|
      new_page_id = app.create_page(input[:page][:title])
      if new_page_id.success?
        redirect_to UrlHelpers.page_path(new_page_id), status: :created
      else
        # TODO: Separate case for "already exists"
        redirect_to action: :new,
          status: :bad_request,
          flash: { error: new_page.failure.message }
      end
    end
  end
end
