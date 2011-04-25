class Comic < ActiveRecord::Base

	default_scope :order => 'position ASC'  
  has_many :comic_pages
  
  def min_comic_position
    (comics.last.try(:position) || -1) + 1
  end

  acts_as_indexed :fields => [:title, :body]
  has_friendly_id :title, :use_slug => true

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :header_image, :class_name => 'Image'
  belongs_to :image
end
