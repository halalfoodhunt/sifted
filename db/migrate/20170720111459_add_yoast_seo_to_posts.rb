class AddYoastSeoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :url_slug, :string
    add_column :posts, :post_snippet, :text
  end
end
