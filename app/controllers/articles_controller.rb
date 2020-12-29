class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "hi", password: "secret", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  # instantiates a new article but doesn't save it
  # used in the view when building the form
  def new
    @article = Article.new
  end

  # instantiates a new article and tries to save it
  # if saved successfully, redirects browser to the artcle's page
  # at http://localhost:3000/articles/#{@article.id}
  # else, redisplay form by rendering articles/new.html
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
