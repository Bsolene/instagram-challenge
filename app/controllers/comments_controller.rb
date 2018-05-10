class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    if @comment.save
      redirect_to post_path(@post)
    else
      flash[:alert] = "You need a text to comment here!"
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
