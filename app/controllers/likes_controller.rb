class LikesController < ApplicationController

	def create
		like = Like.create({liked: params[:liked], read: false, article_id: params[:article_id]})
		render json: like
	end
	def update
		like = Like.find_by(article_id: params[:article_id])
		like.read = true
		like.save
		render json: like
	end 
end