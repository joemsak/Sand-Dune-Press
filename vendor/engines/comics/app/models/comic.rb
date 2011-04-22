class Comic < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :body]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :header_image, :class_name => 'Image'
end
