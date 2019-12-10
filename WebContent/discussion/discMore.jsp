<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="page-enter" content="BlendTrans(Duration=0.5)">
	<meta http-equiv="page-exit" content="BlendTrans(Duration=0.5)">
	
		
    

</head>
<body id="fadein">
		<input type="hidden" id="nickName" value="${sessionScope.nickName}">
		<input type="hidden" id="start" value="${start}">
		<input type="hidden" id="end" value="${end}">
		<div> 
			<c:forEach var="discDto" items="${articles}"> 	
				<table border="1" id="${discDto.dNum}" class="board">
					<tr>
						<th rowspan="3">
							<form id="${discDto.dNum}" class="voteForm">
								<input type="button" value="▲" class="up" name="upb">
								<div id="${discDto.dNum}" class="voteCount">${discDto.dCntVote}</div>
								<input type="button" value="▼" class="down" name="downb">
							</form>
						</th>
						<th>${discDto.dNum}</th>
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
				</table>
				<br>	
			</c:forEach>	
		</div> 
		<!-- <div class="next"> -->
			<a href="discMore.do?sort=${sort}&start=${start}&end=${end}&quantity=${quantity}&search=${search}&searchTime=${searchTime}&searchText=${searchText}" class="nextPage">다음 페이지</a>
		<!-- </div> -->
		
    	<script type="text/javascript" src="/Manni/discussion/js/jquery-3.4.1.js"></script>
		<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteButton.js"></script>
		<script type="text/javascript" src="/Manni/discussion/js/jqueryCountReply.js"></script>
	</body>
</html>