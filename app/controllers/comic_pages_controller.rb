class ComicPagesController < ApplicationController

	respond_to :js

  def show
    @comic_page = ComicPage.find(params[:id])
    render :json => @comic_page
  end


end
