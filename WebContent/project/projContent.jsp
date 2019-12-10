<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<%@ include file="../navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="page-enter" content="BlendTrans(Duration=0.5)">
	<meta http-equiv="page-exit" content="BlendTrans(Duration=0.5)">
	
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/Manni/Resources/css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"> 
    
    <title>Manni: Streamer and editor matching site</title>
    
    <link href="/Manni/project/chat/css/style.css" rel="stylesheet">
    <link href="/Manni/project/chat/css/blue.css" id="theme" rel="stylesheet">
    
    
    
    
</head>
<body id="fadein">
	
	<input type="hidden" id="nickName" value="${sessionScope.nickName}">
	<input type="hidden" id="stName" value="${projDto.stNickName}">
	<input type="hidden" id="edName" value="${projDto.edNickName}">
	
	
	<input type="hidden" value="${sessionScope.nickName}" id="proNickName">
	<input type="hidden" value="${pNum}" id="pNum">
	
		<h2 class="centerText"> ${projDto.stNickName}과 ${projDto.edNickName}의 Project Page </h2>	
		
		
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="jumbotron">
							<h2>안녕하세요, ${sessionScope.nickName}님</h2>
							<p> 이곳은 두분만이 접근할 수 있는 privacy 페이지 입니다.</p>
						</div>


						<div class="row">
							<div class="col-md-12 text-right">
								<c:if test="${projDto.pCode==1}">
									<c:if test="${projDto.edNickName==sessionScope.nickName}">									
										<button type="button" class="btn btn-success" onclick="location='download.do?fileName=${video_name}'">
											원본영상 다운</button>
											<c:if test="${projDto.editUrl==null}">
											<a id="modal-356234" href="#modal-container-projRe"
												role="button" class="btn btn-primary" data-toggle="modal">편집영상
												업로드</a>
											<div class="modal fade" id="modal-container-projRe"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-lg" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="myModalLabel">편집영상 업로드</h5>
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">×</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="row justify-content-center">
																<div class="col-md-8">
																	<div class="card">
																		<header class="card-header">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>
																			<h4 class="card-title mt-2">편집영상 업로드</h4>
																		</header>
																		<article class="card-body">
																			<form id="projRe_form" action="projRePro.do"
																				onsubmit="" method="POST">
																				<input type="hidden" name="pNum" value="${projDto.pNum}">
																				<div class="form-group">
																					<label>닉네임</label> <input type="text"
																						class="form-control" name="ednickName"
																						value="${sessionScope.nickName}" readonly
																						placeholder="">
																				</div>
																				<!-- form-group end.// -->
																				<div class="form-group">
																					<label>편집영상 URL</label> <input type="url"
																						class="form-control" name="editUrl"
																						maxlength="200" placeholder=""> <small
																						class="form-text text-muted">We'll never
																						share your url with anyone else.</small>
																				</div>
																				<!-- form-group end.// -->
																			</form>

																			<button type="button" id="projRe_submit"
																				class="btn btn-primary">Upload</button>
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>

																		</article>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:if>
										<c:if test="${projDto.editUrl!=null}">
											<a id="modal-356235" href="#modal-container-projReModify"
												role="button" class="btn btn-primary" data-toggle="modal">편집영상
												수정</a>
											<div class="modal fade" id="modal-container-projReModify"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog modal-lg" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="myModalLabel">편집영상 수정</h5>
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">×</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="row justify-content-center">
																<div class="col-md-8">
																	<div class="card">
																		<header class="card-header">
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>
																			<h4 class="card-title mt-2">편집영상 수정</h4>
																		</header>
																		<article class="card-body">
																			<form id="projRe_form" action="projRePro.do"
																				onsubmit="" method="POST">
																				<input type="hidden" name="pNum" value="${projDto.pNum}">																				
																				<div class="form-group">
																					<label>닉네임</label> <input type="text"
																						class="form-control" name="nickName"
																						value="${sessionScope.nickName}" readonly
																						placeholder="">
																				</div>
																				<!-- form-group end.// -->
																				<div class="form-group">
																					<label>편집영상 URL</label> <input type="url"
																						class="form-control" name="editUrl"
																						maxlength="200" value="${projDto.editUrl}"
																						placeholder=""> <small
																						class="form-text text-muted">We'll never
																						share your url with anyone else.</small>
																				</div>
																				<!-- form-group end.// -->																			
																			</form>

																			<button type="button" id="projRe_submit"
																				class="btn btn-primary">Upload</button>
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>
																		</article>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:if>
									</c:if>
								</c:if>
							</div>
						</div>
						<br><br>




						<div class="row">
							<div class="col-md-8">
								<video width="480" height="270" controls autoplay="autoplay">
	       <source src="vivi.do?video_name=${video_name}" type="video/mp4">
	     </video>								
							</div>


							<div class="col-md-4">
								<div class="col-md-12">
									<h4 class="box-title m-b-20"> 프로젝트 상세내용 </h4>
									<div class="panel-group" id="accordion1"
										aria-multiselectable="true" role="tablist">
										<div class="panel">
											<div class="panel-heading" id="exampleHeadingDefaultOne"
												role="tab">
												<a class="panel-title" data-toggle="collapse"
													href="#exampleCollapseDefaultOne" data-parent="#accordion1"
													aria-expanded="true"
													aria-controls="exampleCollapseDefaultOne"> 프로젝트 상세내용 </a>
											</div>
											<div class="panel-collapse collapse show"
												id="exampleCollapseDefaultOne"
												aria-labelledby="exampleHeadingDefaultOne" role="tabpanel">
												<div class="panel-body">
													보상액 : ${projDto.pReward}원<br> 마감날짜 :
													<fmt:formatDate value="${projDto.pEndDate}" type="both"
														pattern="yyyy-MM-dd" />	<br>
													편집시간 : ${projDto.pEditTime}분 <br>
													분야 : ${projDto.pField} <br>
													 편집 스타일 : ${projDto.pEditStyle} <br>
													<br>
													<c:if test="${projDto.pCode==0}">
														<c:if test="${sessionScope.nickName==projDto.edNickName}">
															<a id="modal-356234" href="#modal-container-projJoin"
																role="button" class="col-md-12 btn btn-primary"
																data-toggle="modal">참가하기</a>
															<div class="modal fade " id="modal-container-projJoin"
																role="dialog" aria-labelledby="myModalLabel"
																aria-hidden="true">
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="myModalLabel">정말로
																				수락하시겠습니까?</h5>
																			<button type="button" class="close"
																				data-dismiss="modal">
																				<span aria-hidden="true">×</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<form id="projJoin_form" action="projJoinPro.do">
																				<input type="hidden" value="${projDto.pNum}" name="pNum" />																				
																				<div class="col-md-2"></div>
																				<div class="col-md-8">
																					<div class="form-group">
																						<label>닉네임</label> <input type="text"
																							class="form-control" name="nickName"
																							value="${sessionScope.nickName}" readonly
																							placeholder="">
																					</div>
																					<!-- form-group end.// -->
																					<div class="form-group">
																						<label>비밀번호</label> <input type="password"
																							class="form-control" name="passwd"
																							placeholder="비밀번호를 입력하세요.">
																					</div>
																					<!-- form-group end.// -->
																				</div>
																			</form>

																		</div>
																		<div class="modal-footer">
																			<button id="projJoin_submit" type="button"
																				class="btn btn-primary">확인</button>
																			<button type="button" class="btn btn-secondary"
																				data-dismiss="modal">Close</button>
																		</div>
																	</div>
																</div>
															</div>
														</c:if>																												
													</c:if>
												</div>
											</div>
										</div>										
									</div>
								</div>

								<div class="col-md-12">
									<div class="white-box">
										<div class="user-bg">											
											<div class="overlay-box">
												<div class="user-content">
													<a href="javascript:void(0)"><img
														src="https://bootdey.com/img/Content/user_1.jpg"
														class="thumb-lg img-circle" alt="img"></a>
													<strong class="text-success">&nbsp;&nbsp;${projDto.stNickName}</strong>													
												</div>
											</div>
										</div>									
									</div>
								</div>
							</div>
						</div>
						<hr>
						
						<div class="col-md-12">
							 <hr>
						    <div class="chat-main-box">                    
						        <div class="chat-main-header">
						            <div class="p-20 b-b">
						                <h3 class="box-title">Chat Message</h3> </div>
						        </div>
						        <div class="chat-box">
						            <ul class="chat-list slimscroll p-t-30" id="chatList">
						                
						            </ul>
						            <div class="row send-chat-box">
						                <div class="col-sm-12">
						                    <textarea class="form-control" placeholder="메세지를 입력하세요" id="chatArea"></textarea>
						                    <div class="custom-send">
						                        <button class="btn btn-danger btn-rounded" type="button" id="chatSend">Send</button>
						                    </div>
						                </div>
						            </div>
						        </div>                                  
						    </div>
						    <hr>                        						
						</div>

						<c:if test="${projDto.pCode != 0 }">						
						<div class="row">
							<div class="col-md-12">								
								<div class="media-list">
									<div class="media">
										<a href="#" class="pull-left"> <img
											src="https://bootdey.com/img/Content/user_1.jpg" alt=""
											class="img-circle" width="80">
										</a>
										<div class="media-body">
											<strong class="text-success">
												&nbsp;&nbsp;${projDto.edNickName}
											</strong> <span class="text-muted text-right"> </span>
											<p>													
											<c:if test="${projDto.stNickName == sessionScope.nickName}">
											<c:if test="${projDto.pCode != 2}">
												<c:if test="${projDto.editUrl != null}">																									
													<div class="text-muted text-right">
														<a id="modal-356240" href="#modal-container-projChoice"
															role="button" class="btn btn-primary"
															data-toggle="modal">채택하기</a>
														<div class="modal fade " id="modal-container-projChoice"
															role="dialog" aria-labelledby="myModalLabel"
															aria-hidden="true">
															<div class="modal-dialog" role="document">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="myModalLabel">
																			${projDto.edNickName}을 채택하시겠습니까?</h5>
																		<button type="button" class="close"
																			data-dismiss="modal">
																			<span aria-hidden="true">×</span>
																		</button>
																	</div>
																	<div class="modal-body">
																		<form id="projChoice_form" action="projChoicePro.do">
																			<input type="hidden" value="${projDto.pNum}" name="pNum" />	
																			<input type="hidden" value="${projDto.edNickName}" name="edNickName"/>																		
																			<div class="col-md-2"></div>
																			<div class="col-md-8">
																				<div class="form-group">
																					<label>닉네임</label> <input type="text"
																						class="form-control" name="nickName"
																						value="${sessionScope.nickName}" readonly
																						placeholder="">
																				</div>
																				<!-- form-group end.// -->
																				<div class="form-group">
																					<label>비밀번호</label> <input type="password"
																						class="form-control" name="passwd"
																						placeholder="비밀번호를 입력하세요.">
																				</div>
																				<!-- form-group end.// -->
																			</div>
																		</form>
																	</div>
																	<div class="modal-footer">
																		<button id="projChoice_submit" type="button"
																			class="btn btn-primary">채택</button>
																		<button type="button" class="btn btn-secondary"
																			data-dismiss="modal">채택취소</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</c:if>
											</c:if>
											</c:if>
											</p>
											<form name="projVideo_form">											
											<div id="editUrl" data-toggle="collapse" data-target="#projRe">${projDto.editUrl}</div>
											<div class="collapse" id="projRe">
												<iframe id="urlToVideo" height="300" width="600" allowfullscreen></iframe>												
											</div>	
											</form>
										</div>
									</div>
								</div>								
							</div>
						</div>
						</c:if>
					</div>
					</div>						
				<div class="col-md-2"></div>
			</div>
		</div>
	</div>
	
	<div id="mainBottom">
		<h1>Manni는 스트리머와 에디터가 최대한의 시너지를 낼 수 있도록 돕습니다.</h1>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="/Manni/jquery-3.4.1.js"></script>
	
		
    <script src="/Manni/project/chat/js/jquery.slimscroll.js"></script>
    <script src="/Manni/project/chat/js/custom.min.js"></script>
    <script src="/Manni/project/chat/js/chat.js"></script>
	
	<script type="text/javascript" src="/Manni/webSocket.js"></script>
	
		
	<script type="text/javascript">
		$(document).ready(
			function() {
				$("form[name='projVideo_form']").on(
					"click",
					function(event) {
						if (event.target.id == "")
							return false;
						if (event.target.id == "editUrl") {
							var editUrl = $(this).children("#editUrl").html();
							console.log(editUrl);
							var idx = editUrl.indexOf("=") + 1;
							var changeUrl = "https://www.youtube.com/embed/" + editUrl.substring( idx, editUrl.length);
							console.log(changeUrl);
							$(this).find("#urlToVideo").attr('src', changeUrl);
						}
					});
				

				$("#projRe_submit").on(
					"click",
					function(e) {
						var formURL = $("#projRe_form").attr("action");
						$.ajax({
							url : formURL,
							type : "POST",
							data : $("#projRe_form").serialize(),
							dataType : "json",
							success : function(data) {
								alert(data.msg);								
								history.go();
							},
							error : function() {
							}
						});
						e.preventDefault();
				});

				$("#projJoin_submit").on(
					"click",
					function(e) {
						var formURL = $("#projJoin_form").attr("action");
						$.ajax({	
							url : formURL,
							type : "POST",
							data : $("#projJoin_form").serialize(),
							dataType : "json",
							success : function(data) {
								if (data.result == -1) {
									alert(data.msg);	
								} else {
									alert(data.msg);									
									history.go();
								}
							},
							error : function() {}
							});
						e.preventDefault();
					});
				
				$("#projChoice_submit").on(
						"click",
						function(e) {
						var formURL = $("#projChoice_form").attr("action");
						$.ajax({
							url : formURL,
							type : "POST",
							data : $("#projChoice_form").serialize(),
							dataType : "json",
							success : function(data) {
								if (data.result == -1) {
									alert(data.msg);
								} else {
									alert(data.msg);									
									history.go();
								}
							},
							error : function() {}
						});
						e.preventDefault();
					});
		});
	</script>	
	
	<script>
	
		document.getElementById("chatArea").addEventListener(
			"keydown",
			function(event){
				if(event.keyCode == 13){
					event.preventDefault();
					document.getElementById("chatSend").click();
				}
			}	
		);
	
	
		$(document).on(
			"click",
			"button[id=chatSend]",
			function(){
				let msg = $("textarea[id=chatArea]").val();
				let nickName = $("input[id=proNickName]").val();
				let pNum = $("input[id=pNum]").val();
				
				if(msg == ""){
					return false;
				}
				
				let json = 
					{
						chCauseNum : pNum,
						sender : nickName,
						msg : msg
					};
				
				
				$.ajax(
					{
						type: "POST",
						url: "insertChat.do",
						data: json,
						dataType: "json",
						success: function(){
							$("textarea[id=chatArea]").val("");
							
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
							
							projChatFrame();
						}
					}
				);
				
			}
		);
		
		$(document).ready(
			function(){
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
		);
		
		function projChatFrame(){
			let nickName = document.getElementById("nickName").value;
			let stName = document.getElementById("stName").value;
			let edName = document.getElementById("edName").value;
			let receiver = null;
			
			if(nickName != stName){
				receiver = stName;
			}
			else if(nickName != edName){
				receiver = edName;
			}
			
			let json = 
				{
					nickName : nickName,
					receiver : receiver,
				};
			
			let jsonS = JSON.stringify(json);
			let ws = new WebSocket("ws://localhost:8080/Manni/websocketserver.do");
			
			if(!ws){
				alert("웹소켓 연결 실패");
			}else{
				ws.onopen = function(){ws.send(jsonS);}
			}
		}
		
	</script>	
		
	
	</body>
</html>