class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    @name = user.name
    @count = User.count
    @posts = user.posts.order("created_at DESC").page(params[:page]).per(5)
  end
end


