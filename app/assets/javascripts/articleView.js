var ArticleView = Backbone.View.extend({

	template: _.template(),

	initialize: function(){
		this.render();
	},

	render: function(){
		this.$el.html(this.template());
	},

	events {
		'click .likeArticle' : 'like',
		'click .dislikeArticle' : 'dislike'
	},

	like: function(){
		$.post('/likes', {liked:true}).done(function(){
			$.get('/articles').done(function(){
			//instantiate new view
			})
		})
	});

	dislike: function(){
		$.post('/likes', {liked:false}).done(function(){
			$.get('/articles').done(function(){
			//instantiate new view
			})
		})
	});
})