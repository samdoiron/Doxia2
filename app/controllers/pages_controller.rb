class PagesController < ApplicationController
  def index
    render locals: { presenter: PagesIndexPresenter.new }
  end

  def show
    render plain: 'showing a page'
  end
end
