class PostsController < ApplicationController
  before_action :set_post, only: %i[ show update destroy ]

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts
    
  end

  # GET /posts/1
  def show
    render json: @post
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.image.attach(params[:image])

    if @post.save
      # render json: @post, status: :created, location: @post
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /posts/1
  def update
    @post = set_post
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end
  

  # DELETE /posts/1
  def destroy
    #@post.find(params[:id]) destroy
    #render json: @destroy.errors, status: :not_found
    @post = set_post
    @post.destroy

  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
  #    def image
  #   url_for(@posts[0].image)
  # end

    # Only allow a list of trusted parameters through.
    def post_params
      params.permit(:title, :content, :likes, :user_id, :image)
    end
end
