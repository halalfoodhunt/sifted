class PagesController < ApplicationController
  
  def index
			@posts = Post.all.order("date_published DESC")
		end
    @meta_title = meta_title 'SIFTED - Behind the Halal Food Scene'
    @meta_description = 'Sifted is an online magazine to help halal foodies sift through the multiple food choice available out there, and to bring them more information behind the scenes of the halal food scene.'
  end

  def feedback_form
  end
end
