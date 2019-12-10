<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file="../navbar.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="page-enter" content="BlendTrans(Duration=0.5)">
	<meta http-equiv="page-exit" content="BlendTrans(Duration=0.5)">
	
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/Manni/Resources/css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" 
    integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous"> <!--font awesome쓰는거-->
    <title>Manni: Streamer and editor matching site</title>
	<!-- <script type="text/javascript" src="/Manni/jquery-3.4.1.js"></script> -->
</head>
<body id="fadein">
		<!-- 임시 -->
		<input type="hidden" id="nickName" value="${sessionScope.nickName}">
		<input type="hidden" id="dNum" value="${discDto.dNum}">
		<input type="hidden" id="start" value="${discDto.dNum}">
		<input type="hidden" id="end" value="${discDto.dNum}">
		<br><br>
		<div> 
			<table border="1" id="${discDto.dNum}" class="board">
				<tr>
					<th rowspan="3">
						<form id="${discDto.dNum}" class="voteForm">
							<input type="button" value="▲" class="up">
							<div id="${discDto.dNum}" class="voteCount">${discDto.dCntVote}</div>
							<input type="button" value="▼" class="down">
						</form>
					</th>
					<th>${discDto.nickName}</th>
					<th>${discDto.dWriteDate}</th>
					<th><div class="${discDto.dNum}">댓글: ${discDto.dCntReply}</div></th>
				</tr>
				<tr>
					<th colspan="3">${discDto.dTitle}</th>
				</tr>
				<tr>
					<th colspan="3">${discDto.dContent}</th>
				</tr>
				<tr>
					<th colspan="4" class="centerText">
						<input class="inputbutton btn-success" type="button" value="수정" onclick="location='discModifyForm.do?dNum=${discDto.dNum}'">
						<input class="inputbutton btn-danger" type="button" value="삭제" onclick="location='discDelete.do?dNum=${discDto.dNum}'">
						<input class="inputbutton btn-secondary" type="button" value="목록" onclick="location='discussion.do'">
					</th>
				</tr>
			</table>	
		</div> 
		<div>
			<br><br>
			<h2 class="centerText"> <댓글 목록> </h2>
			<br>
			<div class="replyList">
				<c:if test="${discReDtos.size() != 0}">
					<c:forEach var="discReDto" items="${discReDtos}"> 	
						<table border="1" class="replyView" id="${discReDto.dReNum}" style="margin-left: ${570 + discReDto.dReDepth * 100}px;">
							<tr>
								<th>
									<form id="${discReDto.dReNum}" class="voteForm">
										<input type="button" value="▲" class="up">
										<div id="${discReDto.dReNum}" class="voteCount">${discReDto.rCntVote}</div>
										<input type="button" value="▼" class="down">
									</form>
								</th>
								<c:if test="${discReDto.dReBlind == 0}">
									<c:if test="${discReDto.dReNum == requestScope.dReNum}">
										<td style="color: red" id="please">${discReDto.nickName}</td>
										<td style="color: red">${discReDto.dReply}</td>
									</c:if>
									<c:if test="${discReDto.dReNum != requestScope.dReNum}">
										<td>${discReDto.nickName}</td>
										<td>${discReDto.dReply}</td>
									</c:if>
									<td><input type="button" value="삭제" class="deleteReply" id="${discReDto.dReNum}"></td>
								</c:if>
								<c:if test="${discReDto.dReBlind == 1}">
									<td>삭제된 댓글입니다</td>
								</c:if>
							</tr>
						</table>
						<br>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<form class="replyForm">
			<input type="hidden" name="nickName" value="${sessionScope.nickName}">
			<input type="hidden" name="dNum" value="${discDto.dNum}">
			<table border="1" style="margin-left: 570px;">
				<tr>
					<th><textarea class="replyArea" name="dReply" style="width:370px; vertical-align: middle;" placeholder=" 댓글을 입력하십시오."></textarea></th>
					<th><input type="button" value="등록" class="insertReply"></th>
				</tr>
			</table>
		</form>
		
		<script type="text/javascript" src="/Manni/discussion/js/jquery-3.4.1.js"></script>
		<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteLinearNon.js"></script>
		<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteButton.js"></script>
		<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteUpdate.js"></script>
		<!-- <script type="text/javascript" src="/Manni/discussion/js/jqueryCountReply.js"></script> -->
		<script type="text/javascript" src="/Manni/discussion/js/jqueryInfiniteReply.js"></script>
		<script type="text/javascript" src="/Manni/webSocket.js"></script>
	</body>
</html>
