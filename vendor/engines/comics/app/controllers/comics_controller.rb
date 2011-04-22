class ComicsController < ApplicationController

  before_filter :find_all_comics
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @comic in the line below:
    present(@page)
  end

  def show
    @comic = Comic.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @comic in the line below:
    present(@page)
  end

protected

  def find_all_comics
    @comics = Comic.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/comics").first
  end

end
