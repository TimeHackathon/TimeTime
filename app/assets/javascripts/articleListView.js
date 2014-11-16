var ArticleListView = Backbone.View.extend({
	tagName: 'ul',
	className: 'liked-article',

	initialize: function(options){
		this.listenTo(this.collection, 'add', this.addToList);
		if (options.liked){
			this.collection.fetch({liked: true});
			console.log(this.collection)
		} else {
			this.collection.fetch();
		}
		this.render();
	},

	addToList: function(article){
		this.$el.append('<li class="liked-article">' + article.headline + '</li>');
	},

	render: function(){
		$('.container').empty();
		$('.container').append(this.$el);
	}
});

$(function(){
	$('.likes').on('click', function(){
		var likesCollection = new ArticleCollection();
		var likes = new ArticleListView({collection: likesCollection, liked: true});
	})
});