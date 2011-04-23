class ImagesPortfolioEntry < ActiveRecord::Base

  belongs_to :image
  belongs_to :portfolio_entry
	
	cattr_reader :per_page
  @@per_page = 10
  
  before_save do |image_portfolio_entry|
    image_portfolio_entry.position = (ImagesPortfolioEntry.maximum(:position) || -1) + 1
  end

end
