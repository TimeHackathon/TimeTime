var ArticleCollection = Backbone.Collection.extend({
	url: '/articles',
	model: ArticleModel
})