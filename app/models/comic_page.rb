class ComicPage < ActiveRecord::Base
  belongs_to :comic
  image_accessor :image
  
  default_scope :order => 'position ASC'
  
  def next
  	ComicPage.where("position > ? AND comic_id = ?", position, comic_id).first
  end
  
  def previous  		
		ComicPage.where("position < ? AND comic_id = ?", position, comic_id).reverse.first
  end
end
