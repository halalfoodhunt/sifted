class AddFeaturedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured_1, :boolean, default: false
    add_column :posts, :featured_2, :boolean, default: false
    add_column :posts, :featured_3, :boolean, default: false
  end
end
