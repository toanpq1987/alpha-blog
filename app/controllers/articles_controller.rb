class ArticlesController < ApplicationController
	def show

		@article = Article.find(params[:id])
	end

	def index
		@articles = Article.all
	end

	def new
		@article  = Article.new
	end

	def create
		# render plain:  params[:article]
		@article = Article.new(params.require(:article).permit(:title, :description))
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
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(params.require(:article).permit(:title, :description))
		if @article.save
			flash[:notice] = "Article has been updated successfully"
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article  = Article.find(params[:id])
		@article.destroy

		flash[:notice] = "Articles has been deleted successfully"
		redirect_to articles_path
	end

end

