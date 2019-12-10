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
	
		<div> 
			<form method="post" name="insertForm" action="discInsertPro.do" onsubmit="return insertcheck()">
				<input type="hidden" name="nickName" value="${sessionScope.nickName}">
				<input type="hidden" name="dLike" value="628">
				<input type="hidden" name="dField" value="강의">
				<table border="1" class="centerTable">
					<tr>
						<th rowspan="3">
							<input type="button" value="U">
							<br>
							0
							<br>
							<input type="button" value="D">
						</th>
						<th>닉네임자리</th>
						<th>작성일자리</th>
						<th>댓글수</th>
					</tr>
					<tr>
						<th colspan="3">
							<input type="text" name="dTitle">
						</th>
					</tr>
					<tr>
						<th colspan="3">
							<input type="text" name="dContent">
						</th>
					</tr>
					<tr>
						<th colspan="4">
							<input type="submit" value="등록">
						</th>
					</tr>
				</table>	
			</form>
		</div> 
		<div id="mainBottom">
        	<h1> Manni는 스트리머와 에디터가 최대한의 시너지를 낼 수 있도록 돕습니다.</h1>
   		</div>
   		<script type="text/javascript" src="/Manni/discussion/js/jquery-3.4.1.js"></script>
	</body>
</html>