class ComicPagesController < ApplicationController

	respond_to :js

  def show
    @comic_page = ComicPage.find(params[:id])
    render :partial => "/comics/comic_pages", :locals => {:comic_page => @comic_page}
  end


end
