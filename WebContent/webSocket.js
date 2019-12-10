/**
 * 
 */


$(document).ready(
	function(){
		let nickName = document.getElementById("nickName").value;
		
		if(!window.WebSocket){
			alert("웹소켓 지원 X");
			return;
		}
		let ws = new WebSocket("ws://localhost:8080/Manni/websocketserver.do");
		if(!ws){
			alert("서버 연결 실패");
			return;
		}else{
			let json = 
				{
					nickName : document.getElementById("nickName").value
				};
			let jsonS = JSON.stringify(json);

			ws.onopen = function(){ 
				
				ws.send(jsonS);
				setAlarm(json);
			}

			ws.onmessage = function(){
				
				setAlarm(json);
				
				if(location.pathname == "/Manni/projContent.do"){
					setChat();
				}
			}
		}
		
		
	}		
);

function setAlarm(json){
	$.ajax(
		{
			type: "POST",
			url: "setRealTimeAlarm.do",
			data: json,
			dataType: "json",
			success: function(data){
				
//				let dNum = data.dNum;
//				let dReNum = data.dReNum;
//				alert("dNum: " + dNum);
//				alert("dReNum: " + dReNum);
				
				let panel = $("ul[id=realAlarm]");
				let notify = $("span[class=notify]");
				let newAl = "";
				
//				newAl += "<span onclick=";
//				newAl += "location='discContent.do?dNum="+dNum+"&dReNum="+dReNum+"'";
//				newAl += ">댓글이 달렸습니다</span>";
				
				if(data.length != 0){
					for(let i=0; i<data.length; i++){
						if(i != 0){
							newAl += "<br><hr>";
						}
						newAl += "<span class='alarmLine' id='";
						newAl += data[i].aNum + "'";
						newAl += "onclick=location='compContent.do?cNum=";
						newAl += data[i].aCauseNum + "'>";
						newAl += data[i].aMsg + "</span>";
					}
					panel.html(newAl);

					//heartbit, point 추가
					let hp = "";
					hp += "<span class='heartbit'></span>";
					hp += "<span class='point'></span>";
					notify.append(hp);
				}else{
					panel.empty();
					notify.empty();
				}
				
				
				
				
			}
		}
	);
	
}

$(document).on(
	"click",
	"span[class=alarmLine]",
	function(e){
		let target = $(e.target);
		let aNum = target.attr("id");
		let nickName = document.getElementById("nickName").value;
		let notify = $("span[class=notify]");
		
		let json = 
			{
				aNum : aNum,
				nickName : nickName
			};
		
		$.ajax(
			{
				type: "POST",
				url: "deleteAlarm.do",
				data: json,
				dataType: "json",
				success: function(data){
					if(data.result == 1){
						target.remove();
					}
					if(data.count == 0){
						notify.empty();
					}
				}
			}	
			
		
		);
	}
);

function setChat(){

	let msg = $("textarea[id=chatArea]").val();
	let nickName = $("input[id=proNickName]").val();
	let pNum = $("input[id=pNum]").val();
	
	let json = 
		{
			chCauseNum : pNum,
			sender : nickName,
			msg : msg
		};

	$.ajax(
		{
			type: "POST",
			url: "getChat.do",
			data: json,
			dataType: "json",
			success: function(data){
				
				let chatList = "";
				for(let i=0; i < data.length; i++){
					if(data[i].sender == nickName){
						chatList += "<li class='odd'>";
					}else{
						chatList += "<li>";
					}
					chatList += "<div class='chat-body'>";
					chatList += "<div class='chat-text'>";
					chatList += "<h4>" + data[i].sender + "</h4>";
					chatList += "<p>" + data[i].msg + "</p>";
					chatList += "<b>" + data[i].chDateStr + "</b>";
					chatList += "</div>";
					chatList += "</div>";
					chatList += "</li>";
					
				}
				
				$("ul[id=chatList]").html(chatList);
				$("ul[id=chatList]").scrollTop(999999999999);
				
			}
		}
	);
}

