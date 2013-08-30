class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :vote]
  before_action :require_user, only: [:new, :create, :edit, :update, :vote]
  before_action :require_creator_or_admin, only: [:edit, :update]
  def index
  	@posts = Post.all
  end

  def show
  
    @comment = Comment.new
  end

  def new
  	@post = Post.new
    
  end

  def create

    @post = Post.new(post_params)
  
 
    if @post.save
      flash[:notice] = "You created a post"
      redirect_to posts_path
    else

      render :new
    end

  end

  def edit
  end

  def vote
    Vote.create(voteable: @post, creator: current_user, vote: params[:vote])
    
    respond_to do |format|
      flash[:notice] = "your vote was counted"
      redirect_to :back
    end

    format.js 
    
  end

  def update
    
    if @post.update(post_params)
      flash[:notice] = "You updated the post!"
      redirect_to posts_path(@posts)
    else
      render :edit
    end	
  end

  private

  def post_params
    params.require(:post).permit(:title, :url)
  end

  def set_post
    @post = Post.find_by(slug: params[:id])
  end

  def require_creator_or_admin

    access_denied unless logged_? && (@post.creator == current_user || current_user.admin?)
  
  end
end
