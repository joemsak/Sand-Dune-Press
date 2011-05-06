class ComicPagesController < ApplicationController

	respond_to :js

  def show
    @comic_page = ComicPage.find(params[:id])
    render "/comics/comic_pages", :comic_page => @comic_page
  end


end
