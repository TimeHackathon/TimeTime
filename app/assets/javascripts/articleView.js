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
		this.counter += 1

		if(this.model.ad){
			console.log('hey')
			$.get('/articles?count='+this.counter).done(function(response){
				var articleView = new ArticleView({model:response});
			})
		}
		else{

					this.counter += 1
			$.post('/likes', {liked:true,article_id:this.model.id}).done(function(){
				$.get('/articles?count='+this.counter).done(function(response){
					var articleView = new ArticleView({model:response});
				})
			})
		}
	},

	dislike: function(){
		if(this.model.ad){
			console.log('ok')
			$.get('/articles?count='+this.counter).done(function(response){
				var articleView = new ArticleView({model:response});
			})
		}
		else{
			$.post('/likes', {liked:false,article_id:this.model.id}).done(function(){
			$.get('/articles?count='+this.counter).done(function(response){
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
	$.get('/articles?count=0').done(function(response){
		console.log(response)
		articleView = new ArticleView({model:response})

	})
})





