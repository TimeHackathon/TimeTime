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

# Article.delete_all
# x=1
# while x < 10
# 	response = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?sort=newest&page=#{x}&api-key=a96b439050b304551ed93ba9a87f929c:1:69763820")

# 	response["response"]["docs"].each do |article|
# 		if article['multimedia'] == []

# 		else
# 			Article.create({
# 				headline: article["headline"]["main"],
# 				image: "https://www.nytimes.com/#{article['multimedia'][1]['url']}",
# 				blurb: article["snippet"],
# 				category: article["news_desk"]
# 			})
# 		end
# 	end
# 	x+= 1
# end 
words ="Bicycle rights flexitarian vegan artisan, meh nisi aesthetic cred velit. Meggings single-origin coffee butcher salvia gentrify. Gentrify fingerstache before they sold out, polaroid mustache plaid pop-up. Skateboard tattooed salvia voluptate, Vice vero Kickstarter biodiesel do church-key cornhole tilde master cleanse Echo Park pariatur. Umami adipisicing fugiat, deep v drinking vinegar enim Thundercats skateboard sustainable trust fund aliqua hoodie Cosby sweater before they sold out. Occaecat officia laborum culpa YOLO. Bicycle rights jean shorts Pitchfork quinoa, Kickstarter ethical ad banjo Williamsburg est four loko freegan heirloom.

Tattooed nostrud try-hard aliqua. Do deserunt aute raw denim Tonx semiotics. Organic sunt DIY you probably haven't heard of them umami deep v tattooed cupidatat, tempor chambray. Aesthetic gentrify crucifix craft beer, ethical next level ennui DIY lomo irure. Literally messenger bag master cleanse qui. Semiotics meh forage deep v chia yr distillery, et drinking vinegar messenger bag plaid trust fund Neutra aliquip tousled. Pop-up banh mi deserunt brunch single-origin coffee elit.

Ullamco flannel butcher, lomo cliche sunt banjo ethical odio deserunt wolf ea art party. Wolf kale chips Pinterest tempor. Sint cold-pressed hashtag fap Cosby sweater, taxidermy nostrud messenger bag flexitarian aliquip stumptown PBR&B eiusmod you probably haven't heard of them. Cardigan ea deserunt, salvia Shoreditch commodo adipisicing health goth hashtag exercitation. Hashtag Cosby sweater sed, Wes Anderson roof party excepteur velit hella semiotics. Eiusmod roof party occupy put a bird on it Helvetica cillum, lomo ethical magna Pitchfork direct trade banjo. Taxidermy anim literally VHS, sunt paleo chia."

articles = Article.all

articles.each do |article|
	article.content = words
	article.save
end 




