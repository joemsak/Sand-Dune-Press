class AddImagesToComics < ActiveRecord::Migration
  def self.up
    add_column :comics, :image_id, :integer
  end

  def self.down
    remove_column :comics, :image_id
  end
end
