



var ArticleView = Backbone.View.extend({

	template: _.template($('#image-view').html()),
	className:'article',

	initialize: function(){
		this.render();
	},

	render: function(){
		this.$el.html(this.template(this.model));
		$('.container').append(this.$el);
	},

	events: {
		'swiperight .article' : 'like',
		'swipeleft .article' : 'dislike'
	},

	like: function(){
		$.post('/likes', {liked:true}).done(function(){
			$.get('/articles').done(function(response){
				var articleView = new ArticleView({model:response});
			})
		})
	},

	dislike: function(){
		$.post('/likes', {liked:false}).done(function(){
			$.get('/articles').done(function(response){
				var articleView = new ArticleView({model:response});
			})
		})
	}
})



$(function(){
	$.get('/articles').done(function(response){
	articleView = new ArticleView({model:response})

 })
})





