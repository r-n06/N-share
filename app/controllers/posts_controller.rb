class PostsController < ApplicationController
  before_action :move_to_root_path, only: [:show, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :update, :edit, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc)
    if params[:search].present?
      posts = Post.posts_serach(params[:search])
    elsif params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      post = @tag.posts.order(created_at: :desc)
    end
    @tag_lists = Tag.all
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
  end

  def update
    if @post.update(post_params)
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
    redirect_to root_path if params[:keyword] == ""
    split_keyword = params[:keyword].to_s.split(/[[:blank:]]+/)
    @tags = []
    split_keyword.each do |keyword|
      next if keyword == ""
      @tags += Tag.order(created_at: :desc).where(['tagname LIKE ?', "%#{params[:keyword]}%"] )
      end
    @tags.uniq!
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

  def save_posts(tags)
    current_tags = seif.tags.pluk(:tag_name) unless self.tags.nill?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    old_tags.each do |old_name|
      self.tags.delete Tag.find_by(tag_name: old_name)
    end

    new_tags.each do |new_name|
      post_tag = Tag.find_or_create_by(tag_name: new_name)
      self.tags << post_tag
    end
  end
end
