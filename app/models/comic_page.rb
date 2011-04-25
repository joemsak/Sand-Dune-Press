class ComicPage < ActiveRecord::Base
  belongs_to :comic
  image_accessor :image
  
  default_scope :order => 'position ASC'
  
end
