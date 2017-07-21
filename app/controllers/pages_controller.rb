class PagesController < ApplicationController
  
  def index
		if params[:sub_category].blank?
			@posts = Post.all.order("date_published DESC")
		else
			@category_id = SubCategory.find_by(name: params[:sub_category]).id
			@posts = Post.where(sub_category_id: @sub_category_id).order("created_at DESC")
		end
    @meta_title = meta_title 'SIFTED - Behind the Halal Food Scene'
    @meta_description = 'Sifted is an online magazine to help halal foodies sift through the multiple food choice available out there, and to bring them more information behind the scenes of the halal food scene.'
  end

  def feedback_form
  end
end
