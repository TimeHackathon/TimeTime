# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


#generating Fake news for testings

(1..20).each do |fake|
	article = Article.new
	article.headline = Faker::Address.city
	article.blurb = Faker::Lorum.sentences(3).join(' ')
	article.content = Faker::Lorum.sentences(10).join(' ')
	article.image = "http://placekitten.com/g/300/600"
	article.save
end