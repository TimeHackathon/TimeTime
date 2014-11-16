function countUpTo(number){
if(number.toString().length > 2){
	var timeout = 100
}else if(number.toString().length == 2){
	var timeout = 50
}else{
	var timeout=15
}
for(var i = 0; i <= number; i++){
	loopTimeout(i,timeout)

}


}

function loopTimeout(num,timeout){

	setTimeout(function(){
		$('.timeRead').html(num)
	},num*timeout)

}