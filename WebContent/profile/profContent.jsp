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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="/Manni/Resources/css/main.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" 
    integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous"> <!--font awesome쓰는거-->
    <title>Manni: Streamer and editor matching site</title>
    <script src="${project}script.js"></script>
	<script type="text/javascript" src="/Manni/jquery-3.4.1.js"></script>
</head>
<body id="fadein">
	
    <c:if test="${sessionScope.memId != null}">
		<c:if test="${sessionScope.userGrade == 1}">
			<h1 class="centerText">${msg_grade_x}</h1>
		</c:if>
		<c:if test="${sessionScope.userGrade == 2}">
		<h1 class="centerText"> Manni회원의 상세프로필을 확인해보세요! </h1>
	    <br><br>
			<c:if test="${userJob == 0}">
			<div class="centerText">
				<input class="inputbutton btn-primary" type="button" value="협업제안"
					onclick="location= 'projWriteForm.do?edNickName=${userDetailDto.nickName}&stNickName=${sessionScope.nickName}'">
				<br><br>
			</div>
			</c:if>
			<table class="centerTable" style="width:400px">
				<tr class="centerText">
					<th>${str_nickName}</th>
					<td>${userDetailDto.nickName}</td>
				</tr>
				<tr class="centerText">
					<th>${str_preferjob}</th>
					<td>
						<c:if test="${userDetailDto.preferJob == 0}">
                           	스트리머
                        </c:if> 
                        <c:if test="${userDetailDto.preferJob == 1}">
                        	에디터
                        </c:if> 
					</td>
				</tr>
				<tr class="centerText">
					<th>${str_prefercontent}</th>
					<td>
						<c:if test="${userDetailDto.preferContent == 1}">
                           	먹방
                        </c:if>
                        <c:if test="${userDetailDto.preferContent == 2}">
                        	음악
                        </c:if>
                        <c:if test="${userDetailDto.preferContent == 3}">
                        	운동
                        </c:if>
                        <c:if test="${userDetailDto.preferContent == 4}">
                        	"교육"
                        </c:if>
                        <c:if test="${userDetailDto.preferContent == 5}">
                        	"기타"
                        </c:if>
					</td>
				</tr>
				<tr class="centerText">
					<th>${str_age}</th>
					<td>${userDetailDto.age}</td>
				</tr>
				<tr class="centerText">
					<th>${str_gender}</th>
					<td>
						<c:if test="${userDetailDto.gender == 0}">
                           	남자
                        </c:if>
                        <c:if test="${userDetailDto.gender == 1}">
                        	여자
                        </c:if>
					</td>
				</tr>
				<tr class="centerText">
					<th>${str_resume}</th>
					<td>${userDetailDto.resume}</td>
				</tr>
				<tr class="centerText">
					<th>${str_ablepjt}</th>
					<td>
						<c:if test="${userDetailDto.ablePjt == 1}">
                           	<span style="color:blue;">가능</span>
                        </c:if>
                        <c:if test="${userDetailDto.ablePjt == 0}">
                        	<span style="color:red;">불가능</span>
                        </c:if>
					</td>
				</tr>
			</table>
		</c:if>
	</c:if>

	<c:if test="${sessionScope.memId == null}">
		<h1 class="centerText">${msg_login_x}</h1>
	</c:if>
    
    <br><br>
    <div class="centerText">
		<c:if test="${sessionScope.memId == null}">
			<input style="width:15%; height: 40px;" class="inputbutton btn-primary centerText" type="button" value="${btn_login}"
												onclick="location='userLoginForm.do?page=profList.do'">
		</c:if>
		<c:if test="${sessionScope.memId != null}">
			<c:if test="${userDetailDto.nickName == sessionScope.nickName }">
				<input style="width:15%; height: 40px;" class="inputbutton btn-primary centerText" type="button" value="${btn_addinput}"
												onclick="location='userAddInputForm.do?page=profList.do'">
			</c:if>
		</c:if>	
			<input style="width:15%; height: 40px;" class="inputbutton btn-secondary" type="button" value="${btn_back}"onclick="location='profList.do'">
	</div>
    <br><br>
    <div id="mainBottom">
        <h1> Manni는 프로젝트시스템을 적극 권장합니다! </h1>
    </div>
    <script>
    	//a태그 페이드아웃
		$(document).on(
			"click",
			"#link", 
			function (event) {
				event.preventDefault();
				let url = $(this).attr("href");

			    $("html").fadeOut(
			    	"2000", 
			    	"swing",
			    	function(){
			    		location.href = url;
			    	}
			    );
			}
		);
	</script>  
</body>
</html>