class AddSubCategoryIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :sub_category_id, :integer
  end
end
