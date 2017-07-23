class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  
  def should_generate_new_friendly_id?
   title_changed?
  end
  
    has_attached_file :featured_image, styles: { large: "1920x500#", medium: "800x500#", square: "500x500#", thumb: "100x67>" }, default_url: "/images/:style/image-placeholder.jpg"
    validates_attachment_content_type :featured_image, content_type: /\Aimage\/.*\Z/
end
