class AddImagesToBlogPosts < ActiveRecord::Migration
  def self.up
    add_column :blog_posts, :image_id, :integer
  end

  def self.down
    remove_column :blog_posts, :image_id
  end
end
