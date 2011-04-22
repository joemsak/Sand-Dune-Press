class AddPositionToComicPages < ActiveRecord::Migration
  def self.up
    add_column :comic_pages, :position, :integer
  end

  def self.down
    remove_column :comic_pages, :position
  end
end
