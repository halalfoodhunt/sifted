class AddFooterSeoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :footer_seo, :text
  end
end
