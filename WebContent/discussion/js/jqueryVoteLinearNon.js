/**
 * 
 */

//이거 InfiniteReply에도 있음
$(document).ready(
	function(){
		//존재하는 댓글들의 dReNum 을 받아와서 배열을 만든다
		//ajax 로 전송해주고 Map으로 voteCount를 받는다
		//갱신해준다
		
		let replyArray = document.getElementsByClassName("voteCount");
		let numArray = [];

		for(let i=0; i<replyArray.length; i++){
			numArray.push(replyArray[i].id);
		}

		$.ajax(
			{
				type: "POST",
				url: "voteLinearNon.do",
				traditional: true,
				data: {numArray : numArray},
				dataType: "json",
				success: function(data){
					let keys = Object.keys(data);
					if(keys.length != 0){
						for(let i=0; i<keys.length; i++){
							$("div[id=" + keys[i] + "]").html(data[keys[i]]);
						}
					}
				}
			}		
		);
	}
);
