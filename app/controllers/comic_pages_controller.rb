class ComicPagesController < ApplicationController

  before_filter :find_all_comic_pages
  before_filter :find_page

  def index
    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @comic in the line below:
    present(@page)
  end

  def show
    @comic_page = ComicPage.find(params[:id])

    # you can use meta fields from your model instead (e.g. browser_title)
    # by swapping @page for @comic in the line below:
    present(@page)
  end

protected

  def find_all_comics
    @comic_pages = ComicPage.order('position ASC')
  end

  def find_page
    @page = Page.where(:link_url => "/comics/#{ ComicPage.find(params[:id]) }/").first
  end

end
