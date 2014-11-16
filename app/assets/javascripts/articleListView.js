var ArticleListView = Backbone.View.extend({
	tagName: 'ul',
	className: 'liked-article',

	events: {
		'click li.liked-article' : 'articleShow',
		'click button.close' : 'listShow',
		'click button.mark-read' : 'markRead'
	},

	initialize: function(options){
		this.options = options;
		this.listenTo(this.collection, 'add', this.addToList);
		if (options.liked) {
			this.collection.fetch({data:{liked: true}})
		} else if (options.read) {
			this.collection.fetch({data:{read: true}});
		}
		this.render();
	},

	addToList: function(article){

		this.$el.append('<li class="liked-article liked-thumbnail col-xs-3 col-sm-3 col-md-3 col-lg-3"> <img src='+ article.attributes.image  +'> id="' + article.attributes.id + '">' + article.attributes.headline + '</li>');
	},

	render: function(){
		$('.container').empty();
		$('.container').append(this.$el);
	},

	articleShow: function(event){
		var article = this.collection.get(event.target.id);
		if (this.options.read){
			this.$el.empty().append('<li><button class="btn btn-sm close">X</button><h1>' + article.attributes.headline + '</h1><p>' + article.attributes.content + '</p></li>');
		} else {
			this.$el.empty().append('<li id="' + article.attributes.id + '"><h1>' + article.attributes.headline + '<button class="btn btn-sm close">X</button></h1><p>' + article.attributes.content + '</p><button class="btn btn-sm mark-read">Mark As Read</button></li>');
		}
	},
	
	listShow: function(){
		$('.likes').trigger('click');
	},

	markRead: function(event){
		$.ajax({url: '/likes/' + $(event.target).parent().prop('id'), type: 'PUT'});
		$('.likes').trigger('click');
	}
});

$(function(){
	$('.likes').on('click', function(){
		var likesCollection = new ArticleCollection();
		var likes = new ArticleListView({collection: likesCollection, liked: true});
	});

	$('.read').on('click', function(){
		var likesCollection = new ArticleCollection();
		var likes = new ArticleListView({collection: likesCollection, read: true});
	});
});