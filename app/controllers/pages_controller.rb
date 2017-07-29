class PagesController < ApplicationController
  before_filter :is_admin?, only: [:admin_dashboard]
  
  def index
		if params[:sub_category].blank?
			@posts = Post.where(draft: false).order("date_published DESC")
		else
			@sub_category_id = SubCategory.find_by(name: params[:sub_category]).id
			@posts = Post.where(sub_category_id: @sub_category_id).order("date_published DESC")
		end
    @meta_title = meta_title 'SIFTED - Behind the Halal Food Scene'
    @meta_description = 'Sifted is an online magazine to help halal foodies sift through the multiple food choice available out there, and to bring them more information behind the scenes of the halal food scene.'
  end

  def feedback_form
  end
  
  def admin_dashboard
      @posts = Post.all.order("date_published DESC")
  end
  
  def is_admin?
    unless current_user && current_user.admin?
     render "layouts/unauthorised"
    end
  end
end
