class PostsController < ApplicationController
  before_action :move_to_root_path, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :update, :edit, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = PostsTag.new
  end
  
  def create
    @post = PostsTag.new(post_params)
    if @post.valid?
      @post.save
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

  def search
    return nill if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private

  def post_params
    params.require(:posts_tag).permit(:text, :name, :image, :tagname).merge(user_id: current_user.id)
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
