class AddMoreFeaturedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured_4, :boolean, default: false
    add_column :posts, :featured_5, :boolean, default: false
    add_column :posts, :featured_6, :boolean, default: false
  end
end
