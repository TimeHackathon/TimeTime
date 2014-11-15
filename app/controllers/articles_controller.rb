class ArticlesController < ApplicationController

	def index
		likes = Like.all.select(:article_id)
		articles = Article.where()


	end


end




