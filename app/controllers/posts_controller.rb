class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @tags = Tag.all
  end

  def new
    @tag = Tag.find(params[:tag_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿に成功しました"
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "投稿に失敗しました"
    end
  end

  def edit
    @tag = Tag.find(params[:tag_id])
    @post = Post.find(params[:id])
    if @post.user_id == current_user.id
      render controller: :edit
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "投稿に失敗しました"
    end
  end

  def update
    post = Post.find(params[:id])
    if post.update(post_params)
      redirect_to root_path, notice: "投稿を編集しました"
    else
      redirect_back(fallback_location: root_path)
      flash[:notice] = "投稿に失敗しました"
    end
  end

  def show
    @comment = Comment.new
    @post = Post.find(params[:id])
    @tag = Tag.find(params[:tag_id])
    @comments = @post.comments.includes(:user).order("created_at DESC").page(params[:page]).per(5)
  end



  private
  def post_params
    params.require(:post).permit(:title, :content, :image).merge(user_id: current_user.id, tag_id: params[:tag_id])
  end
end
