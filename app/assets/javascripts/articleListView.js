articleShow = false;

var ArticleListView = Backbone.View.extend({
	tagName: 'ul',
	className: 'liked-article',

	events: {
		'click li.liked-article' : 'articleShow'
	},

	initialize: function(options){
		this.options = options;
		this.listenTo(this.collection, 'add', this.addToList);
		if (options.liked){
			this.collection.fetch({data:{liked: true}})
		} else {
			this.collection.fetch();
		}
		this.render();
	},

	addToList: function(article){

		this.$el.append('<li class="liked-article" id="' + article.attributes.id + '">' + article.attributes.headline + '</li>');
	},

	render: function(){
		$('.container').empty();
		$('.container').append(this.$el);
	},

	articleShow: function(event){
		if (articleShow == false){
			var article = this.collection.get(event.target.id);
			if (this.options.read){
				this.$el.empty().append('<li class="liked-article"><h1>' + article.attributes.headline + '</h1><p>' + article.attributes.content + '</p></li>');
			} else {
				this.$el.empty().append('<li class="liked-article"><h1>' + article.attributes.headline + '</h1><p>' + article.attributes.content + '</p><button class="btn btn-sm mark-read">Mark As Read</button></li>');
			}
			articleShow = true;
		} else {
			$('.likes').trigger('click');
			articleShow = false;
		}
	}
});

$(function(){
	$('.likes').on('click', function(){
		var likesCollection = new ArticleCollection();
		var likes = new ArticleListView({collection: likesCollection, liked: true});
	})

	$('.read').on('click', function(){
		var likesCollection = new ArticleCollection();
		var likes = new ArticleListView({collection: likesCollection, read: true});
	})

});