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
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/Manni/Resources/css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css">  
    
	
    <title>Manni: Streamer and editor matching site</title>
   
	
</head>
<body id="fadein">
	<input type="hidden" id="nickName" value="${sessionScope.nickName}">


	<input type="hidden" id="start" value="${start}">
	<input type="hidden" id="end" value="${end}">

	



	<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron jumbotron-fluid">
			    <div class="container">
				    <h1>Competition</h1>      
				    <p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile-first projects on the web.</p>
				</div>				
			</div>		
		</div>	
	
		
		<div class="col-md-2"></div>
		<div class="col-md-8">		
			
			<div class="tabbable mx-auto" id="tabs-8652">
				<ul class="nav nav-tabs">
					
					<li class="nav-item ml-auto">
						<c:if test="${userJob==0}">
							<input type="button" class="btn btn-success mt-2" value="글쓰기" onclick="location='compWriteForm.do'"> &nbsp;
						</c:if>
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
								
				
				<div class="tab-content">
					<div class="tab-pane active" id="tab1">									
						<div align="right" class="search-container">
							<form action="/action_page.php">
								<input type="text" placeholder="Search.." name="search">
							    <button type="submit"><i class="fa fa-search"></i></button>
						    </form>
					 	</div>	 						 	
					
						<table class="table">
							<tbody>									
							<c:forEach var="compDto" items="${compList}">
								<tr>						
									<th width="100px">
										<img width="100" alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg">
									</th>
									<td>										
										<h5>
										<a href="compContent.do?cNum=${compDto.cNum}">${compDto.cTitle}</a>&nbsp;&nbsp;
										<small>(${compDto.cField})</small> 	
										</h5>	
										<a href="#" class="">${compDto.cEditStyle}</a><br>
										마감날짜 : <fmt:formatDate value="${compDto.cEndDate}" type="both" pattern="yyyy-MM-dd"/>																											
									</td>
									<td width="150px" class="align-middle">
										<div class="text-center">
										<h5>${compDto.cReward}</h5>
										<%-- <h5>${compDto.pReward}</h5> --%>
										</div>
									</td>
									<td width="150px" class="align-middle">
										<div class="text-center"><h5>${compDto.nickName}</h5></div>
									</td>
									<td width="150px" class="align-middle">
										<div class="text-center">
										<h5>${compDto.cCode == 0 ? "진행중" : "완료"}</h5>
										<small> 참가자수 : ${compDto.cParCnt}</small><br>										
										<small><fmt:formatDate value="${compDto.cStartDate}" type="both" pattern="yyyy-MM-dd"/></small>
										</div>							
									</td>
								</tr>
								</c:forEach>								
								</tbody>								
						</table>								
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
	
<!-- 	
    <div id="mainBottom">
        <h1> Manni는 스트리머와 에디터가 최대한의 시너지를 낼 수 있도록 돕습니다.</h1>
    </div> -->
	
	<script type="text/javascript" src="/Manni/jquery-3.4.1.js"></script>	
    <script src="/Manni/competition/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/Manni/webSocket.js"></script>	

</body>
</html>