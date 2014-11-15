class LikeController < ApplicationController

	def create
		like = Like.create({liked: params[:liked], read: false, article_id: params[:article_id]})
		render json: like
	end

end