var ArticleView = Backbone.View.extend({

	template: _.template($('#image-view').html()),

	initialize: function(){
		this.render();
	},

	render: function(){
		this.$el.html(this.template());
		$('.container').append(this.$el);
	},

	events: {
		'click .likeArticle' : 'like',
		'click .dislikeArticle' : 'dislike'
	},

	like: function(){
		$.post('/likes', {liked:true}).done(function(){
			$.get('/articles').done(function(response){
				var articleView = new ArticleView({ model:response});
			})
		})
	},

	dislike: function(){
		$.post('/likes', {liked:false}).done(function(){
			$.get('/articles').done(function(response){
				var articleView = new ArticleView({ model:response});
			})
		})
	}
})

