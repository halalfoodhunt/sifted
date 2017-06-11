class AddArticleUrlToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :article_url, :string
  end
end
