class AddFeaturedSixToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :featured_7, :boolean, default: false
  end
end
