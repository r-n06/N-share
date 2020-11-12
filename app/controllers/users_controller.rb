class UsersController < ApplicationController
  def show
    @posts = current_user.posts
    @nickname = current_user.nickname
  end
end
