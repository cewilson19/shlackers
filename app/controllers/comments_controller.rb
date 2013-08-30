class CommentsController < ApplicationController
  before_action :require_user, only: [:create, :vote]
 

  def create
   @post = Post.find_by(slug: params[:post_id])
   @comment = Comment.new(params.require(:comment).permit(:body))
   @comment.post = @post
   @comment.creator = current_user

   if @comment.save
   	flash[:notice] = "Your Comment was created"
   	redirect_to post_path(@post)
   else
   	render 'posts/show'
   end

   def vote
     Vote.create(voteable: @comment, creator: current_user, vote: params[:vote])
      redirect_to comments_path
   end 

  end

 
end
