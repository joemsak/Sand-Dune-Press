class Admin::ComicPagesController < ApplicationController
  def upload
    @comic = Comic.find(params[:id])

    @comic_page = ComicPage.new()
    @comic_page.image = params[:Filedata].tempfile
    @comic_page.position = @comic.min_comic_page_position

    if @comic_page.save and @comic.comic_pages << @comic_page
      comic_page_url = @comic_page.image.thumb('100x100>').url
      render :partial => 'admin/comics/comic_page', :locals => { :comic_page => @comic_page }, :status => 200
    else
      render :text => "There was an error", :status => 500
    end
  end
  
  def update_positions
    params[:comic_page_ids].each_with_index do |id, idx|
      ComicPage.find(id).update_attribute('position',idx)
    end
    render :nothing => true, :status => 200
  end
end
