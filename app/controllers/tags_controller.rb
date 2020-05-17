class TagsController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @tags = Tag.all
  end

  def show
    @tags = Tag.all
    tag = Tag.find(params[:id])
    @posts = tag.posts.order("created_at DESC").page(params[:page]).per(5)
  end
end
