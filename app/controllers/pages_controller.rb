class PagesController < ApplicationController
  include Core

  def index
    render locals: { presenter: PagesIndexPresenter.new }
  end

  def show
    render plain: 'showing a page'
  end
end
