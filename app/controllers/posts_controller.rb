class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @sub_category = SubCategory.all
    if params[:sub_category].blank?
			@posts = Post.where(draft: false).order("date_published DESC")
			  respond_to do |format|
          format.html
          format.rss { render :layout => false }
        end
		else
			@sub_category_id = SubCategory.find_by(name: params[:sub_category]).id
			@posts = Post.where(sub_category_id: @sub_category_id).order("created_at DESC").where(draft: false)
  			respond_to do |format|
          format.html
          format.rss { render :layout => false }
        end
		end
    @meta_title = meta_title 'Sifted by HALALFOODHUNT'
    @meta_description = 'Sifted is an online magazine to help halal foodies sift through the multiple food choice available out there, and to bring them more information behind the scenes of the halal food scene.'
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @ads = Ad.all
    @meta_title = @post.url_slug
    @meta_description = @post.post_snippet
    @canonical_url = posts_path(@post)
    @og_properties = {
      title: @meta_title,
      type:  'website',
      image: @post.featured_image.url(:medium),  # this file should exist in /app/assets/images/logo.png
      url: @canonical_url,
      description: @meta_description
    }
    @posts = Post.all.limit(3)
  end

  # GET /posts/new
  def new
    @current_user = current_user
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to pages_index_path, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :featured_image, :article_url, :draft, :date_published, :category_id, :sub_category_id, :post_snippet, :url_slug, :featured_1, :featured_2, :featured_3, :featured_4, :featured_5, :featured_6, :featured_7, :recommended, :footer_seo)
    end
end
