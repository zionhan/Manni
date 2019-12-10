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
	
    	<h1 class="centerText"> Manni의 Discussion을 통해 소통하세요! </h1>
		<!-- 임시 -->
		<input type="hidden" id="nickName" value="${sessionScope.nickName}">
		<input type="hidden" id="start" value="${start}">
		<input type="hidden" id="end" value="${end}">
		<input type="hidden" id="isChat" value="true">

		<div class="centerText">
			<input class="inputbutton btn-success" type="button" value="글쓰기" onclick="location='discInsertForm.do'">
			<select id="sort">
				<option value="0">정렬 방식</option>
				<option value="1">추천순</option>
				<option value="2">댓글순</option>
				<option value="3">시간순</option>
			</select>
			<input class="inputbutton btn-info" type="button" value="정렬" id="sorting" onclick="sorting()">
			<select id="search">
				<option value="0">검색 대상</option>
				<option value="1">글 제목</option>
				<option value="2">글 내용</option>
				<option value="3">글 작성자</option>
				<option value="4">댓글 내용</option>
				<option value="5">댓글 작성자</option>
			</select>
			<select id="searchTime">
				<option value="0">검색 기간</option>
				<option value="1">최근 1일</option>
				<option value="7">최근 7일</option>
				<option value="30">최근 30일</option>
				<option value="9999">무제한</option>
			</select>
			<input type="text" id="searchText">
			<input class="inputbutton btn-primary" type="button" value="검색" id="searching" onclick="return searching()">
		</div>
		<br><br>
		<div class="scroll" id="autoScroll"> 
			<div> 
				<c:forEach var="discDto" items="${articles}"> 	
					<table border="1" id="${discDto.dNum}" class="board">
						<tr>
							<td rowspan="3">
								<form id="${discDto.dNum}" class="voteForm">
									<input type="button" value="▲" class="up" name="upb">
									<div id="${discDto.dNum}" class="voteCount">${discDto.dCntVote}</div>
									<input type="button" value="▼" class="down" name="downb">
								</form>
							</td>
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
			<div class="next">
				<a href="discMore.do?sort=${sort}&start=${start}&end=${end}&quantity=${quantity}&search=${search}&searchTime=${searchTime}&searchText=${searchText}" class="nextPage">다음 페이지</a>
			</div>
		</div>
		<script type="text/javascript" src="/Manni/discussion/js/jquery-3.4.1.js"></script>
		<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteButton.js"></script>
		<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteUpdate.js"></script>
		<!-- <script type="text/javascript" src="/Manni/discussion/js/jqueryCountReply.js"></script> -->
		<script type="text/javascript" src="/Manni/discussion/js/jquerySelectBoard.js"></script>
		<script type="text/javascript" src="/Manni/discussion/js/jquery.jscroll.js"></script>
		<script type="text/javascript" src="/Manni/discussion/js/jqueryInfiniteScroll.js"></script>
		<script type="text/javascript" src="/Manni/webSocket.js"></script>
		<script>
			function sorting(){
				let sort = $("#sort").children("option:selected").val();
				if(sort == 0){
					alert("정렬 방식을 선택하셈");
					return false;
				}
				location = "discussion.do?sort=" + sort;
			}
			function searching(){
				let search = $("#search").children("option:selected").val();
				let searchTime = $("#searchTime").children("option:selected").val();
				let searchText = $("#searchText").val();
				
				//alert("search: " + search);
				//alert("searchTime: " + searchTime);
				//alert("searchText: " + searchText);
				
				if(search == 0){
					alert("검색 대상을 선택하셈");
					return false;
				}else if(searchTime == 0){
					alert("검색 기간을 선택하셈");
					return false;
				}else if(searchText == ""){
					alert("검색 내용을 입력하셈");
					return false;
				}
				
				location = "discussion.do?search=" + search + "&searchTime=" + searchTime + "&searchText=" + searchText;
			}
			
			
		
			
			
		</script>
		
    	
	</body>
</html>