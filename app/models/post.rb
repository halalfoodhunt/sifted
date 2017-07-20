class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :url_slug, use: :slugged
  
  belongs_to :user
  has_many :categories
  has_many :sub_categories
  
    has_attached_file :featured_image, styles: { large: "1920x500#", medium: "800x500#", square: "500x500#", thumb: "100x67>" }, default_url: "/images/:style/image-placeholder.jpg"
    validates_attachment_content_type :featured_image, content_type: /\Aimage\/.*\Z/
end
