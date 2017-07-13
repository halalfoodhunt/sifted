class Category < ActiveRecord::Base
  belongs_to :post
  has_many :sub_categories
end
