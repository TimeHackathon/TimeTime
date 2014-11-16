function countUpTo(number){

for(var i = 0; i <= number; i++){
	loopTimeout(i)

}


}

function loopTimeout(num){

	setTimeout(function(){
		$('.timeRead').html(num)
	},num*50)

}