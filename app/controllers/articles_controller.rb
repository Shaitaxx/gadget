class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
  end

  privete
  
  def article_params
    params.repuire(:article).parmit(:title, :text, :image, :price).merge(user_id: current_user.id)
  end

end