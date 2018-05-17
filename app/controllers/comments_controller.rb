class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js  # <-- will render `app/views/comments/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'posts/show' }
        format.js  # <-- idem
      end
    end
    # if @comment.save
    #   redirect_to post_path(@post)
    # else
    #   flash[:alert] = "You need a text to comment here!"
    #   render 'posts/show'
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

end
