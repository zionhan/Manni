/**
 * 
 */

//테이블 클릭 게시물 이동!
$(document).on(
	"click",
	"table[class=board]",
	function(event){
		let targetClass = $(event.target).attr("class");
		//alert("targetClass: " + targetClass);
		
		let dNum = $(this).attr("id");
		//alert("dNum: " + dNum);
		//alert("여기맞아");
		
		if(	! (	targetClass == "voteForm" 	|| 
				targetClass == "voteCount" 	|| 
				targetClass == "up" 		|| 
				targetClass == "down"	)	){
			//alert("위if");
			let url = "discContent.do?dNum=" + dNum;
			location.href = url;
		}
		
		return false;
		
	}
);