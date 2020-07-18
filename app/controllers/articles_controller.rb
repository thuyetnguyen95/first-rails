class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        success = @article.update(articleParams)
        if success
            redirect_to @article if success
        else
            render 'edit'
        end
    end
  
    def create
        @article = Article.new(articleParams)

        success = @article.save
        if success
            redirect_to @article
        else
            render 'new'
        end
    end

    def show
        @article = Article.find(params[:id])
    end

    # Private function
    private
        def articleParams
            params.require(:article).permit(:title, :text)
        end
end
