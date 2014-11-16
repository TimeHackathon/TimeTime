counter = 1
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
		'swipeleft' : 'dislike',
		'click' : 'showArticle'
	},

	like: function(){
		counter = counter + 1
		console.log(counter)
		if(this.model.ad){
			console.log('hey')
			$.get('/articles?count='+counter).done(function(response){
				var articleView = new ArticleView({model:response});
			})
		}
		else{
			$.post('/likes', {liked:true,article_id:this.model.id}).done(function(){
				$.get('/articles?count='+counter).done(function(response){
					var articleView = new ArticleView({model:response});
				})
			})
		}
	},

	dislike: function(){
			counter = counter + 1
			console.log(counter)
		if(this.model.ad){
			console.log('ok')
			$.get('/articles?count='+counter).done(function(response){
				var articleView = new ArticleView({model:response});
			})
		}
		else{
			$.post('/likes', {liked:false,article_id:this.model.id}).done(function(){
			$.get('/articles?count='+counter).done(function(response){
					var articleView = new ArticleView({model:response});
				})
			})
		}
	},
	showArticle:function(){
		if(this.model.ad){
			//do nothing
		}else{
			$('.firstView').toggle()
			$('.articleView').toggle()
		}
	}
})



$(function(){
	$.get('/articles?count=1').done(function(response){
		console.log(response)
		articleView = new ArticleView({model:response})

	})
})





