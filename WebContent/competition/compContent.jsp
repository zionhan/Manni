<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
<%@ include file="../navbar.jsp" %>
<!DOCTYPE html>
<html>
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
</head>
<body id="fadein">
	<input type="hidden" id="nickName" value="${sessionScope.nickName}">
	<input type="hidden" id="aCauseNum" value="${cNum}">
	<input type="hidden" id="compWriter" value="${compWriter}">

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="jumbotron">
							<h2> 다른 편집자들과의 선의의 경쟁 </h2>
							<p> 이곳은 본인의 편집실력을 대중적으로 평가받고 다른 사람들의 편집실력을 확인해볼 수 있습니다. <br>
								마음껏  당신의 실력을 뽐내보세요. </p>
							<p>
								<a class="btn btn-primary btn-large" href="compList.do">컴퍼티션
									리스트</a>
							</p>
						</div>


						<div class="row">
							<div class="col-md-12 text-right">
								<c:if test="${compDto.cCode==0}">
									<c:if test="${cReNum!=0}">
										<button type="button" class="btn btn-success" onclick="location='download.do?fileName=${video_name}'">
											원본영상 다운</button>
										<c:if test="${isCReDate!=1}">
											<a id="modal-356234" href="#modal-container-compRe"
												role="button" class="btn btn-primary" data-toggle="modal">편집영상
												업로드</a>
											<div class="modal fade" id="modal-container-compRe"
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
																			<form id="compRe_form" action="compRePro.do"
																				onsubmit="" method="POST">
																				<input type="hidden" name="cReNum" value="${cReNum}">
																				<input type="hidden" name="cNum" value="${cNum}">
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
																						maxlength="200" placeholder=""> <small
																						class="form-text text-muted">We'll never
																						share your url with anyone else.</small>
																				</div>
																				<!-- form-group end.// -->

																				<div class="form-row">
																					<div class="col form-group">
																						<label>사용툴</label> <input class="form-control"
																							type="text" name="editTool" />
																					</div>
																					<!-- form-group end.// -->
																					<div class="col form-group">
																						<label>사용 플러그인</label> <input class="form-control"
																							type="text" name="editPlugin" />
																					</div>
																					<!-- form-group end.// -->
																				</div>


																				<div class="form-group">
																					<label>한줄 설명</label>
																					<textarea class="form-control" rows="3"
																						name="cComment" maxlength="500" placeholder=""></textarea>
																				</div>
																				<!-- form-group end.// -->
																			</form>

																			<button type="button" id="compRe_submit"
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
										<c:if test="${isCReDate==1}">
											<a id="modal-356235" href="#modal-container-compReModify"
												role="button" class="btn btn-primary" data-toggle="modal">편집영상
												수정</a>
											<div class="modal fade" id="modal-container-compReModify"
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
																			<form id="compRe_form" action="compRePro.do"
																				onsubmit="" method="POST">
																				<input type="hidden" name="cReNum" value="${cReNum}">
																				<input type="hidden" name="cNum" value="${cNum}">
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
																						maxlength="200" value="${compParDto.editUrl}"
																						placeholder=""> <small
																						class="form-text text-muted">We'll never
																						share your url with anyone else.</small>
																				</div>
																				<!-- form-group end.// -->

																				<div class="form-row">
																					<div class="col form-group">
																						<label>사용툴</label> <input class="form-control"
																							type="text" name="editTool"
																							value="${compParDto.editTool}" />
																					</div>
																					<!-- form-group end.// -->
																					<div class="col form-group">
																						<label>사용 플러그인</label> <input class="form-control"
																							type="text" name="editPlugin"
																							value="${compParDto.editPlugin}" />
																					</div>
																					<!-- form-group end.// -->
																				</div>


																				<div class="form-group">
																					<label>한줄 설명</label>
																					<textarea class="form-control" rows="3"
																						name="cComment" maxlength="500"
																						value="${compParDto.cComment}" placeholder=""></textarea>
																				</div>
																				<!-- form-group end.// -->
																			</form>

																			<button type="button" id="compRe_submit"
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
								<a id="modal-356236" href="#modal-container-compList"
									role="button" class="btn btn-primary" data-toggle="modal">참가자
									리스트</a>
								<div class="modal fade" id="modal-container-compList"
									role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="myModalLabel">참가자 리스트</h5>
												<button type="button" class="close" data-dismiss="modal">
													<span aria-hidden="true">×</span>
												</button>
											</div>
											<div class="modal-body">
												<div class="row text-center h-50">
													<c:forEach var="compParDto" items="${compParList}">
														<div class="col-md-2">
															<a href="#" class=""> <img
																src="https://bootdey.com/img/Content/user_1.jpg" alt=""
																class="img-circle" width="40">
															</a>
														</div>
														<div class="col-md-4 my-auto">${compParDto.nickName}</div>
														<div class="col-md-4 my-auto">
															<fmt:formatDate value="${compParDto.cJoinDate}"
																type="both" pattern="yyyy-MM-dd" />
														</div>
														<div class="col-md-2 my-auto">${compParDto.cReDate==null ? "x" : "o"}</div>
														<hr>
													</c:forEach>
												</div>
											</div>
											<div class="modal-footer">												
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br>




						<div class="row">
							<div class="col-md-7">
								<video width="480" height="270" controls autoplay="autoplay">
	       <source src="vivi.do?video_name=${video_name}" type="video/mp4">
	     </video>
								<div class="col-md-12">
									<br> ${compDto.cContent}
								</div>
							</div>


							<div class="col-md-5">
								<div class="col-md-12">
									<h4 class="box-title m-b-20">${compDto.cTitle}</h4>
									<div class="panel-group" id="accordion1"
										aria-multiselectable="true" role="tablist">
										<div class="panel">
											<div class="panel-heading" id="exampleHeadingDefaultOne"
												role="tab">
												<a class="panel-title" data-toggle="collapse"
													href="#exampleCollapseDefaultOne" data-parent="#accordion1"
													aria-expanded="true"
													aria-controls="exampleCollapseDefaultOne"> 1차 컴퍼티션 </a>
											</div>
											<div class="panel-collapse collapse show"
												id="exampleCollapseDefaultOne"
												aria-labelledby="exampleHeadingDefaultOne" role="tabpanel">
												<div class="panel-body">
													보상액 : ${compDto.cReward}원<br> 마감날짜 :
													<fmt:formatDate value="${compDto.cEndDate}" type="both"
														pattern="yyyy-MM-dd" /> <br>
													 편집시간 : ${compDto.cEditTime}분 <br>
													 분야 : ${compDto.cField} <br>
													 편집스타일 : ${compDto.cEditStyle} <br>
													<br>
													<c:if test="${compDto.cCode==0}">
														<c:if test="${cReNum==0}">
															<c:if test="${sessionScope.nickName!=compDto.nickName}">
																<c:if test="${userJob == 1}">
																	<a id="modal-356234" href="#modal-container-compJoin"
																		role="button" class="col-md-12 btn btn-primary"
																		data-toggle="modal">참가하기</a>
																	<div class="modal fade " id="modal-container-compJoin"
																		role="dialog" aria-labelledby="myModalLabel"
																		aria-hidden="true">
																		<div class="modal-dialog" role="document">
																			<div class="modal-content">
																				<div class="modal-header">
																					<h5 class="modal-title" id="myModalLabel">정말로
																						참가하시겠습니까?</h5>
																					<button type="button" class="close"
																						data-dismiss="modal">
																						<span aria-hidden="true">×</span>
																					</button>
																				</div>
																				<div class="modal-body">
																					<form id="compJoin_form" action="compJoinPro.do">
																						<input type="hidden" value="${cNum}" name="cNum" />
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
																					<button id="compJoin_submit" type="button"
																						class="btn btn-primary">확인</button>
																					<button type="button" class="btn btn-secondary"
																						data-dismiss="modal">Close</button>
																				</div>
																			</div>
																		</div>
																	</div>
																</c:if>
															</c:if>
														</c:if>
														<c:if test="${cReNum!=0}">
															<a id="modal-356237" href="#modal-container-compLeave"
																role="button" class="col-md-12 btn btn-primary"
																data-toggle="modal">참가취소</a>
																<br>																
															<div class="modal fade " id="modal-container-compLeave"
																role="dialog" aria-labelledby="myModalLabel"
																aria-hidden="true">
																<div class="modal-dialog" role="document">
																	<div class="modal-content">
																		<div class="modal-header">
																			<h5 class="modal-title" id="myModalLabel">정말로
																				참가를 철회 하시겠습니까?</h5>
																			<button type="button" class="close"
																				data-dismiss="modal">
																				<span aria-hidden="true">×</span>
																			</button>
																		</div>
																		<div class="modal-body">
																			<form id="compLeave_form" action="compLeavePro.do">
																				<input type="hidden" value="${cNum}" name="cNum" />
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
																			<button id="compLeave_submit" type="button"
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
													<br>
													<a href="javascript:void(0)"><img
														src="https://bootdey.com/img/Content/user_3.jpg"
														class="thumb-lg img-circle" alt="img"></a>
													<h4 class="">${compDto.nickName}</h4>
													<input type="hidden" value="${compDto.nickName}">
													<h5 class="">info@myadmin.com</h5>
												</div>
											</div>
										</div>
										<div class="user-btm-box">
											
										</div>
									</div>
								</div>
							</div>
						</div>
						<hr>



						<div class="row">
							<div class="col-md-12">
								<c:forEach var="compParDto" items="${compReList}">
									<div class="media-list">
										<div class="media">
											<form id="${compParDto.cReNum}" class="voteForm">
												<input type="hidden" id="nickName" value="${sessionScope.nickName}">
												<input type="button" value="U" class="up" name="upb">
												<div id="${compParDto.cReNum}" class="voteCount"></div>
												<input type="button" value="D" class="down" name="downb">
											</form>
										
											<a href="#" class="pull-left"> <img
												src="https://bootdey.com/img/Content/user_1.jpg" alt=""
												class="img-circle" width="80">
											</a>
											<div class="media-body">
												<strong class="text-success">
													&nbsp;&nbsp;${compParDto.nickName} </strong> 
													<input type="hidden" value="${compParDto.nickName}" id="winner">
													<span
													class="text-muted pull-right"> <small
													class="text-muted">&nbsp;&nbsp;<fmt:formatDate
															value="${compParDto.cReDate}" type="both"
															pattern="yyyy-MM-dd" /></small>
												</span>
												<p>
												<div class="col-md-8">
													&nbsp;&nbsp;${compParDto.cComment} <br>
													<a href="#">&nbsp;&nbsp;#${compParDto.editTool}&nbsp;#${compParDto.editPlugin}</a></div>
													<c:if test="${compDto.nickName == sessionScope.nickName}">
														<c:if test="${compDto.edNickName == null}">
															<div class="text-muted text-right col-md-4">
																<a id="modal-356240" href="#modal-container-compChoice"
																	role="button" class="btn btn-primary"
																	data-toggle="modal">채택하기</a>
																<div class="modal fade " id="modal-container-compChoice"
																	role="dialog" aria-labelledby="myModalLabel"
																	aria-hidden="true">
																	<div class="modal-dialog" role="document">
																		<div class="modal-content">
																			<div class="modal-header">
																				<h5 class="modal-title" id="myModalLabel">
																					${compParDto.nickName}을 채택하시겠습니까?</h5>
																				<button type="button" class="close"
																					data-dismiss="modal">
																					<span aria-hidden="true">×</span>
																				</button>
																			</div>
																			<div class="modal-body">
																				<form id="compChoice_form" action="compChoicePro.do">
																					<input type="hidden" value="${cNum}" name="cNum" />
																					<input type="hidden" value="${compParDto.nickName}"
																						name="edNickName" />
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
																				<button id="compChoice_submit" type="button"
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
												</p>
												<form class="compUrlForm" name="${compParDto.cReNum}">		
													<div id="editUrl" data-toggle="collapse" data-target="#d${compParDto.cReNum}">${compParDto.editUrl}</div>
													<div class="collapse" id="d${compParDto.cReNum}">
														<iframe id="urlToVideo" height="300" width="600" allowfullscreen></iframe>												
													</div>																			
												</form>
												<hr>														
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
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
	<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteLinearNon.js"></script>
	<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteButton.js"></script>
	<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteUpdate.js"></script>
	<script type="text/javascript" src="/Manni/webSocket.js"></script>
	
	<script type="text/javascript">
		$(document).ready(
			function() {
				$("form[class=compUrlForm]").on(
					"click",
					function(event) {
						if (event.target.id == "")
							return false;
						if (event.target.id == "editUrl") {
							var editUrl = $(this).find("#editUrl").html();
							console.log(editUrl);
							var idx = editUrl.indexOf("=") + 1;
							var changeUrl = "https://www.youtube.com/embed/" + editUrl.substring( idx, editUrl.length);
							console.log(changeUrl);
							$(this).find("#urlToVideo").attr('src', changeUrl);
						}
					}); 
				

				$("#compRe_submit").on(
					"click",
					function(e) {
						var formURL = $("#compRe_form").attr("action");
						$.ajax({
							url : formURL,
							type : "POST",
							data : $("#compRe_form").serialize(),
							dataType : "json",
							success : function(data) {
								alert(data.msg);
								
								let target = document.getElementById("compWriter").value;
								let sentence = "(이)가 편집영상을 업로드했습니다";
								compAlarmFrame(target, sentence);
								
								history.go();
							},
							error : function() {
							}
						});
						e.preventDefault();
				});

				$("#compJoin_submit").on(
					"click",
					function(e) {
						var formURL = $("#compJoin_form").attr("action");
						$.ajax({	
							url : formURL,
							type : "POST",
							data : $("#compJoin_form").serialize(),
							dataType : "json",
							success : function(data) {
								if (data.result == -1) {
									alert(data.msg);	
								} else {
									alert(data.msg);

									let target = document.getElementById("compWriter").value;
									let sentence = "(이)가 컴퍼티션에 참가했습니다";
									compAlarmFrame(target, sentence);
									
									history.go();
								}
							},
							error : function() {}
							});
						e.preventDefault();
					});

				$("#compLeave_submit").on(
					"click",
					function(e) {
						var formURL = $("#compLeave_form").attr("action");
						$.ajax({
							url : formURL,
							type : "POST",
							data : $("#compLeave_form").serialize(),
							dataType : "json",
							success : function(data) {
								if (data.result == -1) {
									alert(data.msg);
								} else {
									alert(data.msg);
								/* 	$("#modal-container-compLeave").modal("hide"); */
									history.go();
								}
							},
							error : function() {}
						});
						e.preventDefault();
					});

				$("#compChoice_submit").on(
						"click",
						function(e) {
						var formURL = $("#compChoice_form").attr("action");
						$.ajax({
							url : formURL,
							type : "POST",
							data : $("#compChoice_form").serialize(),
							dataType : "json",
							success : function(data) {
								if (data.result == -1) {
									alert(data.msg);
								} else {
									alert(data.msg);

									let target = document.getElementById("winner").value;
									let sentence = "(이)에게 채택 받았습니다";
									compAlarmFrame(target, sentence);
									
									history.go();
								}
							},
							error : function() {}
						});
						e.preventDefault();
					});
		});
		
		function compAlarmFrame(target, sentence){
			let nickName = document.getElementById("nickName").value;
			let aCauseNum = document.getElementById("aCauseNum").value;
			let receiver = target;
			let aMsg = nickName + sentence;
			
			let json = 
				{
					nickName : nickName,
					aCauseNum : aCauseNum,
					receiver : receiver,
					aMsg : aMsg
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