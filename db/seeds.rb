# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#generating Fake news for testings

# (1..20).each do |fake|
# 	article = Article.new
# 	article.headline = Faker::Address.city
# 	article.blurb = Faker::Lorem.sentences(3).join(' ')
# 	article.content = Faker::Lorem.sentences(10).join(' ')
# 	article.image = "http://placekitten.com/g/300/600"
# 	article.save
# end

Article.delete_all
x=1
while x < 10
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
	x+= 1
end 