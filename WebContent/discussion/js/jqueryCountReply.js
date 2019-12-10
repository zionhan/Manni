/**
 * 
 */

//이거 InfiniteReply에도 있음
$(document).ready(
	function(){
		//dNum을 받아서 
		//ajax로 man_disc_reply에서 카운트셀렉트
		//그것을 다시 넣어주면 땡이다
		let boardArray = document.getElementsByClassName("board");
		let numArray = [];

		for(let i=0; i<boardArray.length; i++){
			numArray.push(boardArray[i].id);
		}

		$.ajax(
			{
				type: "POST",
				url: "countReply.do",
				traditional: true,
				data: {numArray : numArray},
				dataType: "json",
				success: function(data){
					let keys = Object.keys(data);
					for(let i=0; i<keys.length; i++){
						let re = "댓글: " + data[keys[i]];
						$("div[class=" + keys[i] + "]").html(re);
					}
				}
			}		
		);
	}
);