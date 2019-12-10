

//<form name="${discDto.dNum}" class="voteForm">
//	<input type="button" value="U" id="up">
//	<div id="${discDto.dNum}" class="voteCount"></div>
//	<input type="button" value="D" id="down">
//</form>


/*$(document).ready(
	function () { */

//좋아요 갱신
$(document).on(
	"click",
	"form[class=voteForm]",
/*$("form[class=voteForm]").on(
	"click",*/
	function(event){
		//alert(event.type);
		//form의 공백 눌러서 비어있다면 return false
		let targetClass = $(event.target).attr("class");
		//alert("targetClass: " + targetClass);
		
		if(targetClass == "voteCount"){
			//alert("리턴폴스");
			return false;
		}
		
		let nickName = $("#nickName").val();
		//alert("nickName: " + nickName);
		let vCauseNum = $(this).attr("id");
		//alert("vCauseNum: " + vCauseNum);

		let vote = 0;
		if($(event.target).attr("class") == "up"){
			vote = 1;								
		}
		else if($(event.target).attr("class") == "down"){
			vote = -1;						
		}

		//id, dNum, vote 보내주면
		//받은 쪽에서 vote 반영 후 -> 셀렉 날려서 돌려주면 된다
		
		let voteCount = $(this).children(".voteCount");
		let up = $(this).children(".up");
		let down = $(this).children(".down");
		let json = 
			{
				nickName : nickName,
				vCauseNum : vCauseNum, 
				vote : vote
			};
		
		$.ajax(
			{
				type: "POST",
				url: "voteUpdate.do",
				data: json,
				dataType: "json",
				success: function(data){
					//alert("통신 성공");
					//alert("data.voteCount: " + data.voteCount);
					//코드에 따라 버튼을 조작해주자 00 01 10 11
					//숫자 갱신
					if(data.voteCount != undefined){
						//alert("voteCount not null");
						voteCount.html(data.voteCount);
						
//						up.val("U"); // 기본셋
//						down.val("D");
						up.attr("name", "upb");
						down.attr("name", "downb");

						if(data.button == "01"){
//							down.val("D눌림");
							down.attr("name", "downbpush");
						}else if(data.button == "11"){
//							up.val("U눌림");												
							up.attr("name", "upbpush");
						}
						
					}
					/*else if(data.voteCount == undefined){
						//alert("아 언디파인드네 ㅡㅡ");
					}*/
				}
			}		
		);
		
	
		return false; // table 버블링 방지용
	}

);
		
		
	/*}
);*/