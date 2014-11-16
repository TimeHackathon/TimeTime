# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Article.delete_all
x=1
while x < 50
	if(x % 2 == 0)
		response = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?sort=newest&page=#{x}&api-key=a96b439050b304551ed93ba9a87f929c:1:69763820")

		response["response"]["docs"].each do |article|
			if article['multimedia'] == []

			else
				Article.create({
					headline: article["headline"]["main"],
					image: "https://www.nytimes.com/#{article['multimedia'][1]['url']}",
					blurb: article["snippet"],
					category: article["news_desk"]
					})
			end
		end
	end
	x+= 1
end 
how_long = (50..500).to_a



articles = Article.all

articles.each do |article|
	words = Faker::Lorem.sentences(how_long.sample).split('').join(' ')
	length = words.split(' ').length/200
	article.content = words 
	article.read_time = "#{length} minutes"
	article.save

end 

Like.delete_all




