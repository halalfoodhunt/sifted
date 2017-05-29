class AddAuthorProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :author_profile, :text
  end
end
