class ArticlesController < ApplicationController
  def index
    @tags = Tag.all
    @articles = Article.all.page(params[:page]).per(8)
  end
end
