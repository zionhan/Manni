/**
 * 
 */

//댓글 표시할곳 -> table로 다시 짜야함
//div class="replyList"
//    table class="replyView" id=Num
//        input class="deleteReply" id=Num
//
//댓글 입력할곳
//form class="replyForm"
//    textarea class="replyArea" name="dReply"
//    input class="insertReply"
//
//대댓글 박스
//form class="reReplyForm" id=Num
//    textarea class="reReplyArea" name="dReply"
//    input class="insertReReply"

//폼 형태랑 이름 용도좀 정리해놔
//대댓글 박스처리
$(document).on(
	"click",
	"table[class=replyView]",
	function(event){
		let replyView = $(this);
		let dReNum = replyView.attr("id");
		let dNum = document.getElementById("dNum").value;
		
		$.ajax(
			{
				type: "POST",
				url: "discReGetDepth.do",
				data: {dReNum : dReNum},
				dataType: "json",
				success: function(data){
					let dReDepth = data.dReDepth;
					let reReplyForm = document.getElementsByClassName("reReplyForm")[0];
					
					if(reReplyForm != undefined){
						//존재하는 경우!
						if(dReNum == reReplyForm.id){
							//존재가 내가 누른 곳에 있음
							reReplyForm.remove();												
						}else{
							reReplyForm.remove();						
							setReReplyForm(dReNum, dNum, dReDepth, replyView);
						}
					}else{
						setReReplyForm(dReNum, dNum, dReDepth, replyView);
					}
				}
			}		
		);	
	}
);

//댓글 입력처리(전체갱신)
$(document).on(
	"click",
	"input[class=insertReply]",
	function(event){
		$.ajax(
			{
				type: "POST",
				url: "discRePro.do",
				data: $("form[class=replyForm]").serialize(),
				dataType: "json",
				success: function(data){
					setReplyList(data);
					$("textarea[class=replyArea]").val("");
					nonLinear();
					countReply();
					voteButton();
				}
			}		
		);	

	}
);


//대댓글 입력처리(전체갱신)
$(document).on(
	"click",
	"input[class=insertReReply]",
	function(event){
		$.ajax(
			{
				type: "POST",
				url: "discRePro.do",
				data: $("form[class=reReplyForm]").serialize(),
				dataType: "json",
				success: function(data){
					setReplyList(data);
					nonLinear();
					countReply();
					voteButton();
				}
			}		
		);	
		//해당 글번호와 최신댓글(내가위에달은댓글), 그리고 그 부모댓글의 닉네임을 보내주면 된다.
		//여기서 가능한 건 글번호 뿐.
		//ajax 받은 쪽에서 최신댓글 검색 후 그 부모댓글 닉네임 검색해서 alarm db에 넣어줘야함
		
		let dNum = document.getElementById("dNum");
		$.ajax(
				{
					type: "POST",
					url: "alarmReRe.do",
					data: {dNum, dNum},
					dataType: "json",
					success: function(data){
						alert("성공");
					}
				}		
			);	
	}
);

//댓글 삭제처리
$(document).on(
	"click",
	"input[class=deleteReply]",
	function(event){
		let dReNum = $(this).attr("id");
		let dNum = document.getElementById("dNum").value;
		let json = 
			{
				dReNum : dReNum,
				dNum : dNum
			};
		
		$.ajax(
			{
				type: "POST",
				url: "discReDelete.do",
				data: json,
				dataType: "json",
				success: function(data){
					setReplyList(data);
				}
			}		
		);	
	}
);




///////////////////함수 선언부


//댓글 목록 갱신
function setReplyList(data){
	let re = "";
	
	for(let i=0; i<data.length; i++){
		re += "<table border='1' class='replyView' id='" + data[i].dReNum + "' style='margin-left: " + (570 + data[i].dReDepth * 100) + "px'>";
		re += "<tr>";
		re += "<th>";
		re += "<form id='" + data[i].dReNum + "' class='voteForm'>";
		re += "<input type='button' value='▲' class='up'>";
		re += "<div id='" + data[i].dReNum + "' class='voteCount'></div>";
		re += "<input type='button' value='▼' class='down'>";
		re += "</form>";
		re += "</th>";
		re += "<td>" + data[i].nickName + "</td>";
		if(data[i].dReBlind == 0){
			re += "<td>" + data[i].dReply + "</td>";
			re += "<td><input type='button' value='삭제' class='deleteReply' id='" + data[i].dReNum + "'></td>";
		}else{
			re += "<td>삭제된 댓글입니다</td>";
		}
		re += "</tr>";
		re += "</table>";
		re += "<br>";
	}
	
	$(".replyList").html(re);
}

//댓글 박스
function setReReplyForm(dReNum, dNum, dReDepth, replyView){
	let nickName = document.getElementById("nickName").value;
	let area = "";
	
	area += "<form class='reReplyForm' id=" + dReNum + " style='margin-left: " + (570 + dReDepth * 100) + "px'>";
	   area += "<table border='1'>";
	   area += "<tr>";
	   area += "<th><textarea class='reReplayArea' name='dReply' style='width:370px; vertical-align: middle;' placeholder=' 댓글을 입력하십시오.'></textarea></th>";
	   area += "<th><input type='button' value='등록' class='insertReReply'></th>";
	   area += "<input type='hidden' name='dNum' value='"+ dNum +"'>";
	   area += "<input type='hidden' name='nickName' value='" + nickName + "'>";
	   area += "<input type='hidden' name='dReParent' value='" + dReNum + "'>";
	   area += "</tr>";
	   area += "</table>";
	   area += "</form>";
	   
	replyView.after(area);	
}

//jqueryVoteLinearNon
function nonLinear(){
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
				for(let i=0; i<keys.length; i++){
					$("div[id=" + keys[i] + "]").html(data[keys[i]]);
				}
			}
		}		
	);
}

//jqueryCountReply
function countReply(){
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

//버튼업뎃
function voteButton() {
	
	let nickName = $("#nickName").val();
//	let nickName = sessionStorage.getItem( nickName );
	//alert(nickName);
	$("form[class=voteForm]").each(
		function(index){
			let parent = $(this);
			let vCauseNum = parent.attr("id");
			let json = 
				{
					nickName : nickName,
					vCauseNum : vCauseNum
				};
			$.ajax(
				{
					type: "POST",
					url: "voteButton.do",
					data: json,
					dataType: "json",
					success: function(data){
						if(data.vote == 1){
							parent.children(".up").attr("name", "upbpush");
						}else if(data.vote == -1){
							parent.children(".down").attr("name", "downbpush");
						}
					}
				}
			);
		}
	);
	
}
