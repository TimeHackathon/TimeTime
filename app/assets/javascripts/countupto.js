function countUpTo(number){

for(var i = 0; i <= number; i++){
	loopTimeout(i)

}


}

function loopTimeout(num){
if(num.toString().length > 2){
	var timeout = 100
}else if(num.toString().length == 2){
	var timeout = 70
}else{
	var timeout=35
}
	setTimeout(function(){
		$('.timeRead').html(num)
	},num*timeout)

}