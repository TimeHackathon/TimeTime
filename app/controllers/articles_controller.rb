class ArticlesController < ApplicationController

	def index

		if(params[:category])
			likes = Like.all.select(:article_id)
			if(params[:category]=='art')
				articles = Article.where.not(id:likes).where('category = ? OR category= ? OR category =?', "Arts&Leisure", "Culture", "Society").first
			elsif(params[:category]=='style')
				articles = Article.where.not(id:likes).where(category:'Styles')
			elsif(params[:category]=='sports')
				articles = Article.where.not(id:likes).where(category:'Sports')
			elsif(params[:category]=='opinion')
				articles = Article.where.not(id:likes).where('category = ? OR category= ? OR category =?', "Editorial", "OpEd", "Letters").first
			elsif(params[:category]=='news')
				articles = Article.where.not(id:likes).where('category = ? OR category= ? OR category =?', "Foreign", "National", "Metro").first
			elsif(params[:category]=='business')
				articles = Article.where.not(id:likes).where('category = ? OR category= ?', "SundayBusiness", "Business").first
			elsif(params[:category]=='opionion')
				articles = Article.where.not(id:likes).where('category = ? OR category= ?', "Automobiles", "RealEstate").first
			end

		elsif(params[:liked])
			likes = Like.where(liked:true).select(:article_id)
			articles = Article.where(id:likes)

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







