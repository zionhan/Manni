/**
 * 
 */

// 지금 해야할 일 -> '아이디' 식별해서 '눌린 U,D는 눌려있다고 뜨도록!'

//InfiniteReply에도 넣어줬음
$(document).ready(
	function(){
		
//		<form name="${discDto.dNum}" class="voteForm">
//			<input type="button" value="U" id="up">
//			<div id="${discDto.dNum}" class="voteCount"></div>
//			<input type="button" value="D" id="down">
//		</form>
		
		//voteForm 을 잡아서 each를 돌리는데
		//vCauseNum과 nickName으로 getVoteLog의 값 받기
		//0이 아닌 경우 해당하는 버튼을 눌러놓는다
		
		let nickName = $("#nickName").val();
//		let nickName = sessionStorage.getItem( "nickName" );
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
);
