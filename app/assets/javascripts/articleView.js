counter = 1;
category = '';

var ArticleView = Backbone.View.extend({

	template: _.template($('#image-view').html()),
	className:'article',

	initialize: function(){
		this.render();

	},

	render: function(){
		$('.container').empty()
		if(this.model.blurb.split(' ').length > 20){
			this.model.blurb = this.model.blurb.split(' ').slice(0,20).join(' ')+'...'
		}
		this.$el.html(this.template(this.model));
		$('.container').append(this.$el);
		setTimeout(function(){
			$('figure').addClass('cs-hover')
		},1000)
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
			$.get('/articles?count='+counter).done(function(response){
				var articleView = new ArticleView({model:response});
			})
		}
		else{
			$.post('/likes', {liked:false,article_id:this.model.id}).done(function(){
				if (category.length > 0) {
					$.get('/articles?count='+ counter + '&category=' + category).done(function(response){
							var articleView = new ArticleView({model:response});
						})
				} else {
					$.get('/articles?count='+counter).done(function(response){
						var articleView = new ArticleView({model:response});
					})
				}
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

function home(){
	$.get('/articles?count=1').done(function(response){
		articleView = new ArticleView({model:response})
	});
};

$(function(){

	home();

	$('.home').on('click', function(){
		category = '';
		home();
	});

	$('.dropdown-menu').on('click', function(event){
        var text = $(event.target).text();
		category = text.split(' ')[0].toLowerCase();

		$.get('/articles?count=' + counter  + '&category=' + category).done(function(response){
			articleView = new ArticleView({model:response})
		});
	});

	$('.stats').on('click', function(){
		$.get('/stats').done(function(data){
			console.log(data)
			$('.container').empty();
			$('.container').append('<div class="col-xs-6 col sm-6 col-md-6 col-lg-6"><h3 class="stat">Likes</h3><canvas id="myChart" width="400" height="400"></canvas></div><div class="min-read col-xs-6 col sm-6 col-md-6 col-lg-6"><h3 class="stat">Minutes Read</h3><span class="timeRead">0</span></div>');
			countUpTo(data.time_read)
			var ctx = $('#myChart').get(0).getContext('2d');
			var myDoughnutChart = new Chart(ctx).Doughnut(data.data, { segmentShowStroke: true, segmentStrokeColor: '#fff', segmentStrokeWidth: 2, percentageInnerCutout: 50, animationSteps: 100, animationEasing: 'easeOutBounce', animateRotate: true})
		console.log(data.time_read)
		})
	})
})





