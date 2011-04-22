class CreateComics < ActiveRecord::Migration

  def self.up
    create_table :comics do |t|
      t.string :title
      t.text :body
      t.integer :header_image_id
      t.integer :position

      t.timestamps
    end

    add_index :comics, :id

    load(Rails.root.join('db', 'seeds', 'comics.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "comics"})

    Page.delete_all({:link_url => "/comics"})

    drop_table :comics
  end

end
