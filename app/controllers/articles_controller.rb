class ArticlesController < ApplicationController

	before_action :set_article, only: [:show, :edit, :update, :destroy]
	def show

		
	end

	def index
		@articles = Article.all
	end

	def new
		@article  = Article.new
	end

	def create
		# render plain:  params[:article]
		@article = Article.new(article_params)
		if  @article.save
		# render plain: @article.inspect

		# redirect_to "/article/"  +  @article.id
		# redirect_to article_path(@article)
			flash[:notice]  = "Article has been created successfully"
			redirect_to @article
		else
			render 'new'
		end
	end

	def edit
		
	end

	def update
		
		@article.update(article_params)
		if @article.save
			flash[:notice] = "Article has been updated successfully"
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		
		@article.destroy

		flash[:notice] = "Articles has been deleted successfully"
		redirect_to articles_path
	end

	private
	def set_article
		@article = Article.find(params[:id])
	end

	def article_params
		params.require(:article).permit(:title, :description)
	end
end

