class PostsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to @post
    else
      flash[:alert] = "Halt, you fiend! You need an image to post here!"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @post.update(post_params)
      flash[:success] = "Post updated"
+     redirect_to(post_path(@post))
    else
      flash[:alert] = "Something is wrong with your form!"
      render "edit"
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def find_params
    @post = Post.find(params[:id])
  end
end
