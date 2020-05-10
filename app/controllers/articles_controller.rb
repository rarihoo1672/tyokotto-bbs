class ArticlesController < ApplicationController
  def index
    @articles = Article.all.page(params[:page]).per(5)
  end

  def show
    @article = Article.find(params[:id])
  end
end
