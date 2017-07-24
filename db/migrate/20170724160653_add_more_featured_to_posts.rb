class AddMoreFeaturedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured_4, :boolean
    add_column :posts, :featured_5, :boolean
    add_column :posts, :featured_6, :boolean
  end
end
