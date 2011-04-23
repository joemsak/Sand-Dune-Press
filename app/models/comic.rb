class Comic < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :body]
  has_friendly_id :title, :use_slug => true

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :header_image, :class_name => 'Image'
  belongs_to :image
end
