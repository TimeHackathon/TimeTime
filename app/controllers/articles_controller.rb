class ArticlesController < ApplicationController

	def index
		puts params
		if(params[:category])
			likes = Like.all.select(:article_id)
			articles = Article.where.not(id:likes).where(category:params[:category]).first
		elsif(params[:liked])
			likes = Like.where(liked:true).select(:article_id)
			articles = Article.where(id:likes)
			puts 'hello'
		else

			likes = Like.all.select(:article_id)
			articles = Article.where.not(id:likes).first
			puts params[:count]
			if(params[:count].to_i % 5 == 0)
					articles = Ad.all.sample
			end



		end
		render json: articles
	end


end





