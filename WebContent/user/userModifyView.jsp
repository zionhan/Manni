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
	
    <h1 class="centerText"> 회원정보를 수정하실 수 있습니다! </h1>
    <br><br>
    <c:if test="${result == 1}">
        <form name="modifyform" method="post" action="userModifyPro.do" onsubmit="return modifycheck()">
            <table class="centerTable">
                <tr> 
                    <th colspan="2" class="centerText"> ${msg_modify} </th>
                </tr>
                <tr>
                    <th class="centerText"> ${str_id} </th>
                    <td class="centerText"> &nbsp;${userDto.id} </td>
                </tr>
                <tr>
                    <th rowspan="2" class="centerText"> ${str_passwd} </th>
                    <td>
                        <input class="input" type="password" name="passwd"
                            maxlength="15" value="${userDto.passwd}">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="input" type="password" name="repasswd"
                            maxlength="15">	
                    </td>	
                </tr>
                <tr>
                    <th class="centerText"> ${str_nickName} </th>
                    <td class="centerText"> &nbsp;${userDto.nickName} </td>
                </tr>
                <tr>
                    <th class="centerText"> ${str_joinDate} </th>
                    <td class="centerText">
                        &nbsp;<fmt:formatDate value="${userDto.joinDate}" type="both"
                            pattern="yyyy-MM-dd HH:mm"/>					
                    </td>
                </tr>
                <tr>
                    <th colspan="2" class="centerText">
                        <input class="inputbutton btn-primary" type="submit" value="${btn_mod}">
                        <input class="inputbutton btn-secondary" type="reset" value="${btn_cancel}">
                        <input class="inputbutton btn-danger" type="button" value="${btn_mod_cancel}"
                            onclick="location='userMain.do'">
                    </th>
                </tr>
            </table>			
        </form>	
    </c:if>
    <c:if test="${result != 1}">		
	<script type="text/javascript">
		<!--
		erroralert( loginpasswderror );
		//-->
	</script>
    </c:if>	
    <div id="mainBottom">
        <h1> Manni는 주기적인 비밀번호 변경을 통한 보안강화를 권장합니다. </h1>
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