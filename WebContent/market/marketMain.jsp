<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
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
		
    <div class="row">    
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="tabbable mx-auto" id="tabs-8652">
				<ul class="nav nav-tabs">					
					<li class="nav-item ml-auto">
						<input type="button" class="btn btn-success mt-2" value="글쓰기" onclick="location='marketWriteForm.do'"> &nbsp;
					</li>
					<li class="nav-item dropdown">
						<button type="button" class="btn btn-primary dropdown-toggle mb-4" data-toggle="dropdown">
							Sort By
					    </button>
					    <div class="dropdown-menu">
							<a class="dropdown-item" href="compList.do?sort=0">전체목록</a>
							<a class="dropdown-item" href="compList.do?sort=1">진행중</a>
							<a class="dropdown-item" href="compList.do?sort=2">종료</a>
					    </div>
					</li>					
				</ul>		
		
		
				
				<div class="row">
					<c:forEach var="marketDto" items="${marketList}">
					<div class="col-md-3" style="padding-top:20px">
						<div class="card">
							<img src="https://bootdey.com/img/Content/user_1.jpg" class="card-img-top" height="150px">
							<div class="card-body">
								<h5 class="card-title">${marketDto.nickName}</h5>
								<p class="card-text">${marketDto.mTitle}</p>
								<a href="marketContent.do?mNum=${marketDto.mNum}" class="btn btn-primary">Go somewhere</a>
							</div>
							<div class="card-footer" style="padding:5px 5px">
								<h5 class="">&nbsp;${marketDto.mGuarantee}</h5>
							</div>
						</div>				
					</div>
					</c:forEach>									
				</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>		
	</div>    
    
    
    
   
   	<div id="mainBottom">
	<h1>Manni는 스트리머와 에디터가 최대한의 시너지를 낼 수 있도록 돕습니다.</h1>
	</div>
	
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="/Manni/jquery-3.4.1.js"></script>	
	
	</body>
</html>