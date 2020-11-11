class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :index
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(post_params)
    if @post.update
      redirect_to edit_post_path
    else
      render :update
    end
  end

  private

  def post_params
    params.require(:post).permit(:text, :name, :image)
  end
end
