class ArticlesController < ApplicationController

	def index
		likes = Like.all.select(:article_id)
		articles = Article.where.not(id:likes).first

		render json: articles

	end


end




