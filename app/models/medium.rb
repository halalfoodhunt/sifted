class Medium < ActiveRecord::Base
    has_attached_file :media_upload, styles: { large: "1920x500#", medium: "800x500#", square: "500x500#", thumb: "100x67>" }, default_url: "/images/:style/image-placeholder.jpg"
    validates_attachment_content_type :media_upload, content_type: /\Aimage\/.*\Z/
end
