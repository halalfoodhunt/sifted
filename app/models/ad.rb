class Ad < ActiveRecord::Base
    before_create :set_ad_expiry
    
    has_attached_file :image, styles: { portrait: "350x420#", large: "1920x500#", medium: "800x500#", square: "500x500#", thumb: "100x67>" }, default_url: "/images/:style/image-placeholder.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    
    def set_ad_expiry
        self.expiry_date =  Date.today + 365.days
    end
end
