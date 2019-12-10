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
	
   <h1 class="centerText"> Manni에 등록된 회원들의 Rank를 확인하세요! </h1>
    <br><br>
    <c:if test="${cnt == 0}">
        <table class="centerTable">
            <tr>
                <td colspan="4" class="centerText">${msg_list}</td>
            </tr>
        </table> 
    </c:if>
    <div class="centerText">
    	<input class="inputbutton btn-danger" type="button" value="스트리머 순위"
	                       onclick="location='rankList.do?preferJob=0'"> 
	   	<input class="inputbutton btn-primary" type="button" value="에디터 순위"
	                       onclick="location='rankList.do?preferJob=1'">
	</div>	
    <c:if test="${cnt != 0}">
        <table class="rank" style="width: 80%; table-layout:fixed">
            <tr>
            	<c:if test="${preferJob == 0}">
	                <c:forEach var="manVote" items="${StreamerArticles}" varStatus="status">
	                        <th class="centerText" onclick="location='profContent.do?edNickName=${manVote.nickName}&nickName=${sessionScope.nickName}'"
	                            align="center" style="width : 80%; height : 20%;">
	                            	순위 : ${status.count}등<br>  
	                            	${str_nickName} : ${manVote.nickName} <br>
	                            	${str_vote} : ${manVote.vote} <br>
	                        </th>
	                       	<tr>
	                       	</tr>
	                </c:forEach>
	            </c:if>
	            <c:if test="${preferJob == 1}">
	                <c:forEach var="manVote" items="${EditorArticles}" varStatus="status">
	                        <th class="centerText" onclick="location='profContent.do?edNickName=${manVote.nickName}&nickName=${sessionScope.nickName}'"
	                            align="center" style="width : 80%; height : 20%;">
	                            	순위 : ${status.count}등<br>  
	                            	${str_nickName} : ${manVote.nickName} <br>
	                            	${str_vote} : ${manVote.vote} <br>
	                        </th>
	                       	<tr>
	                       	</tr>
	                </c:forEach>
	            </c:if>
            </tr>
        </table>
    </c:if>
    
    <br><br>
    <div class="centerText">
    	<input class="inputbutton btn-secondary" type="button" value="${btn_main}"
                        onclick="location='userMain.do'">
    </div>
  
    <div id="mainBottom">
        <h1> Manni는 스트리머와 에디터가 최대한의 시너지를 낼 수 있도록 돕습니다.</h1>
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