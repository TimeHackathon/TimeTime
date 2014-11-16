var ArticleView = Backbone.View.extend({

	template: _.template($('#image-view').html()),
	className:'article',

	initialize: function(){
		this.render();
	},

	render: function(){
		$('.container').empty()
		this.$el.html(this.template(this.model));
		$('.container').append(this.$el);
	},

	events: {
		'swiperight' : 'like',
		'swipeleft' : 'dislike'
	},

	like: function(){
		$.post('/likes', {liked:true,article_id:this.model.id}).done(function(){
			$.get('/articles').done(function(response){
				var articleView = new ArticleView({model:response});
			})
		})
	},

	dislike: function(){
		$.post('/likes', {liked:false,article_id:this.model.id}).done(function(){
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





