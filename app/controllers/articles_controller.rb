# Generated `$ bin/rails generate controller articles`
class ArticlesController < ApplicationController

  # 9.1 Basic Authentication
http_basic_authenticate_with name: "josiah", password: "unstoppable", except: [:index, :show]

  # The usual practice is to place it as the first method in the controller.
  # Let's do it:
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # create article here
    @article = Article.new(article_params)

    if @article.save # if it saves succesfully ...
      redirect_to @article #... show page
    else
      render 'new' # ... else show the form again
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
