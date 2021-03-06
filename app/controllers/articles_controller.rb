class ArticlesController < ApplicationController

	def index

		if(params[:category])
			puts params
			
			
			if(params[:category]=='art')
				articles = Article.where.not(id:likes).where('category = ? OR category= ? OR category =?', "Arts&Leisure", "Culture", "Society").first
			elsif(params[:category]=='style')
				articles = Article.where.not(id:likes).where(category:'Styles').first
				puts articles
			elsif(params[:category]=='sports')
				articles = Article.where.not(id:likes).where(category:'Sports').first
			elsif(params[:category]=='opinion')
				articles = Article.where.not(id:likes).where('category = ? OR category= ? OR category =?', "Editorial", "OpEd", "Letters").first
			elsif(params[:category]=='news')
				articles = Article.where.not(id:likes).where('category = ? OR category= ? OR category =?', "Foreign", "National", "Metro").first
			elsif(params[:category]=='business')
				articles = Article.where.not(id:likes).where('category = ? OR category= ?', "SundayBusiness", "Business").first
			end
		puts articles.blank?
			if articles.blank?
				articles = {headline:'No Current Articles In This Category', blurb:'Sorry but there is currently no content in this category', content:'Sorry', image:''}
		
			end


		elsif(params[:liked])
			likes = Like.where(liked:true).select(:article_id)
			articles = Article.where(id:likes)
		elsif(params[:read])
			read = Like.where(read:true).select(:article_id)
			articles = Article.where(id:read)


		else
			likes = Like.all.select(:article_id)
			categories = Article.where(id:likes)
			like_stuff = {}
			categories.each do |category|
				Like.where(article_id:category.id)
				if like_stuff.has_key?(category.category)
					if(Like.find_by(article_id:category.id).liked == true)
						like_stuff[category.category][:liked] += 1
					else
						like_stuff[category.category][:disliked] += 1
					end

				else
					if(Like.find_by(article_id:category.id).liked == true)
						like_stuff[category.category] = {liked:1 , disliked:0}
					else
						like_stuff[category.category] = {liked:0 , disliked:1}
					end
				end
			end
			like_percentages = {}
			like_stuff.each do |k,v|
				all = v[:liked]+v[:disliked]
					# puts (v[:liked]/(v[:liked]+v[:disliked])).to_f
					like_percentages[k] = v[:liked]/all.to_f
				end
				like_percentages = like_percentages.sort_by { |k, v| v}.reverse

				articles = []
				the_categories = []
				like_percentages.each do |like|
					articles.push(Article.where.not(id:likes).where(category:like[0]))
					the_categories.push(like[0])
				end

				articles.push(Article.where.not(category:the_categories,id:likes))

				articles.flatten!

				puts articles.length
				articles = articles[0]


				puts params[:count]
				if(params[:count].to_i % 5 == 0)
					articles = Ad.all.sample
				end



			end



			# def graphs
			# 	read = Like.where(read:true).select(:article_id)
			# 	articles = Article.where(id:read)
			# 	minutes_read = 0
			# 	articles.each do |article|
			# 		length = article.content.split(' ')
			# 		length = length.length
			# 		length = length/250.to_f
			# 		minutes_read += length
			# 		puts length
			# 	end

			# end



			render json: articles
		end

		def stats
			data = {time_read:0,data:[]}
			likes = Like.where(liked:true).select(:article_id)

			articles = Article.where(id:likes).where('category = ? OR category= ? OR category =?', "Arts&Leisure", "Culture", "Society")
			data[:data].push({label:'Art', color:'#000',highlight:'#AF2C29', value:articles.length})

			articles = Article.where(id:likes).where(category:'Styles')
			data[:data].push({label:'Style', color:'#222', highlight:'#AF2C29',value:articles.length})

			articles = Article.where(id:likes).where(category:'Sports')
			data[:data].push({label:'Sports',color:'#333', highlight:'#AF2C29',value:articles.length})


			articles = Article.where(id:likes).where('category = ? OR category= ? OR category =?', "Editorial", "OpEd", "Letters")
			data[:data].push({label:'Opinion',color:'#444',highlight:'#AF2C29', value:articles.length})

			articles = Article.where(id:likes).where('category = ? OR category= ? OR category =?', "Foreign", "National", "Metro")
			data[:data].push({label:'News',color:'#555',highlight:'#AF2C29', value:articles.length})

			articles = Article.where(id:likes).where('category = ? OR category= ?', "SundayBusiness", "Business")
			data[:data].push({label:'Business', color: '#666', highlight:'#AF2C29', value:articles.length})

			total_time_read = 0
			read = Like.where(read:true).select(:article_id)
			read_articles = Article.where(id:read)
			read_articles.each do |article|

				data[:time_read] = data[:time_read]+article.read_time.to_i
			end
			puts total_time_read


			render json: data

		end



	end



























