class ArticlesController < ApplicationController
  before_action :move_to_find, except: [:index, :new, :create]
  before_action :move_to_index, except: [:index, :show]

  def index
    @articles = Article.all.order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    redirect_to root_path unless current_user == @article.user
  end

  def update
    if @article.update(article_params)
      redirect_to article_path
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, :price).merge(user_id: current_user.id)
  end

  def move_to_find
    @article = Article.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
