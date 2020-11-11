class PostsController < ApplicationController
  before_action :move_to_root_path, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :update, :edit, :destroy]

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
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      binding.pry
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:text, :name, :image).merge(user_id: current_user.id)
  end

  def move_to_root_path
    @post = Post.find(params[:id])
    unless user_signed_in? && current_user.id == @post.user.id
      redirect_to root_path
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
