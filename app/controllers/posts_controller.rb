class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :tag_find, only: [:new, :edit, :show]
  before_action :post_find, only: [:edit, :show]


  def index
    @posts = Post.all.includes(:user).order("created_at DESC").page(params[:page]).per(20)
    @tags = Tag.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to user_path(current_user.id), notice: "投稿しました"
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "投稿できませんでした"
    end
  end

  def edit
    (@post.user_id == current_user.id) ? (render controller: :edit) : (redirect_back(fallback_location: root_path))
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to tag_post_path, notice: "投稿しました"
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "投稿できませんでした"
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end


  private
  def post_params
    params.require(:post).permit(:title, :content, :image).merge(user_id: current_user.id, tag_id: params[:tag_id])
  end

  def tag_find
    @tag = Tag.find(params[:tag_id])
  end

  def post_find
    @post = Post.find(params[:id])
  end
end
