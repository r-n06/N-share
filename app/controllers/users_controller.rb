class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @posts = user.posts.order(created_at: :desc)
    @nickname = current_user.nickname
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def likes
    likes = Like.where(user_id: current_user.id).pluck(:post_id)
    @like_list = Post.find(likes)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
end
