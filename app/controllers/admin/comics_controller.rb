module Admin
  class ComicsController < Admin::BaseController

    crudify :comic,
            :title_attribute => 'title', :xhr_paging => true
            
    def create
      @comic = Comic.new(params[:comic])
      if @comic.save
        redirect_to edit_admin_comic_path(@comic), :notice => 'Add photos, bro'
      else
        render :new
      end
    end
  end
end
