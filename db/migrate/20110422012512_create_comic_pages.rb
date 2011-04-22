class CreateComicPages < ActiveRecord::Migration
  def self.up
    create_table :comic_pages do |t|
      t.string :image_uid
      t.integer :comic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comic_pages
  end
end
