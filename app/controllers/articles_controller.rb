class ArticlesController < ApplicationController

	def index

		if(params[:category])
			likes = Like.all.select(:article_id)
			articles = Article.where.not(id:likes).where(category:params[:category]).first
		else

			likes = Like.all.select(:article_id)
			if(Like.all.length % 5 == 0)
				articles = Ad.all.sample
			else
				articles = Article.where.not(id:likes).first
			end
		end

		render json: articles

	end


end





