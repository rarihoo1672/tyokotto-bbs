class ArticlesController < ApplicationController
  def index
    @tags = Tag.all
    @articles = Article.all.page(params[:page]).per(8)
  end

  def show
    @article = Article.find(params[:id])
  end
end
