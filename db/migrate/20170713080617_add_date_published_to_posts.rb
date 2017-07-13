class AddDatePublishedToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :date_published, :datetime
  end
end
