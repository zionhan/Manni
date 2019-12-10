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
	
    <h1 class="centerText"> 추가정보 입력을 통해 Contributor 등급이 되세요! </h1>
    <br><br>
    <form name="addinputform" method="post" action="userAddInputPro.do" onsubmit="return addinputcheck()">
        <table class="centerTable">
            <tr>
                <th colspan="2" class="centerText" style="width: 700px; font-size: 30px; background-color: #dce9f9;"> ${msg_addinput} </th>
            </tr>	
            <tr class="centerText">
                <th style="width: 200px; font-size: 20px;" class="centerText"> ${str_nickName} </th>	
                <td style="width: 300px; font-size: 20px;" class="centerText"> &nbsp;${userDto.nickName} </td>	
            </tr>
            <tr>
                <th class="centerText" style="font-size: 20px;"> * ${str_preferjob} </th>
                <td class="centerText">
                    <label><input type="radio" name="preferJob" value="0">스트리머</label>
                    <label><input type="radio" name="preferJob" value="1">에디터</label>
                    <label><input type="radio" name="preferJob" value="2">음향 전문가</label>
                    <label><input type="radio" name="preferJob" value="3">촬영 전문가</label>
                </td>
                    
            </tr>
            <tr>
                <th class="centerText" style="font-size: 20px;"> * ${str_prefercontent} </th>
                <td class="centerText">
                    <label><input style="padding-" type="radio" name="preferContent" maxlength="15" value="0">게임 </label>
                    <label><input type="radio" name="preferContent" maxlength="15" value="1">먹방</label>
                    <label><input type="radio" name="preferContent" maxlength="15" value="2">음악</label>
                    <label><input type="radio" name="preferContent" maxlength="15" value="3">운동</label>
                    <label><input type="radio" name="preferContent" maxlength="15" value="4">교육</label>
                    <label><input type="radio" name="preferContent" maxlength="15" value="5">기타</label>
                </td>
            </tr>
            <tr>
                <th class="centerText" style="font-size: 20px;"> * ${str_age} </th>
                <td class="centerText"><input class="centerText" style="width: 40px" type="text" name="age" maxlength="3" value="${userDetailDto.age}"> 세</td>
            </tr>
            <tr>
                <th class="centerText" style="font-size: 20px;"> * ${str_gender} </th>
                <td class="centerText">
                    <label><input type="radio" name="gender" value="0">남자</label>
                    <label><input type="radio" name="gender" value="1">여자</label>	
                </td>
            </tr>
            <tr>
                <th class="centerText" style="font-size: 20px;"> * ${str_tel} </th>
                <td class="centerText">
                    <c:if test="${userDetailDto.tel == null || userDetailDto.tel == '' }">
                        <input style="width: 40px" class="input centerText" type="text" name="tel1" maxlength="3"
                            onkeyup="nexttel2()">
                        - <input style="width: 40px" class="input centerText" type="text" name="tel2" maxlength="4"
                            onkeyup="nexttel3()">
                        - <input style="width: 40px" class="input centerText" type="text" name="tel3" maxlength="4"
                            onkeyup="nextresume()">
                    </c:if>
                    <c:if test="${userDetailDto.tel != null && userDetailDto.tel != '' }">
                        <c:set var="t" value="${fn:split(userDetailDto.tel, '-')}"/>
                        <input style="width: 40px" class="input centerText" type="text" name="tel1" maxlength="3"
                            onkeyup="nexttel2()" value="${t[0]}">
                        - <input style="width: 40px" class="input centerText" type="text" name="tel2" maxlength="4"
                            onkeyup="nexttel3()" value="${t[1]}">
                        - <input style="width: 40px" class="input centerText" type="text" name="tel3" maxlength="4"
                            onkeyup="nextresume()" value="${t[2]}">
                    </c:if>
                </td>
            </tr>
            <tr>
                <th class="centerText" style="font-size: 20px;"> ${str_resume} </th>
                <td class="centerText"><textarea style="width: 380px;" maxlength="1000" class="input" name="resume" rows="10" cols="46"
                    value="${userDetailDto.resume}"></textarea></td>
            </tr>
            <tr>
                <th class="centerText" style="font-size: 20px;"> * ${str_ablepjt} </th>
                <td class="centerText">
                    <label><input type="radio" name="ablePjt" value="1">가능</label>
                    <label><input type="radio" name="ablePjt" value="0">불가능</label>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="centerText">
                    <input class="inputbutton btn-primary" type="submit" value="${btn_ok}">
                    <input class="inputbutton btn-secondary" type="reset" value="${btn_cancel}">
                    <input class="inputbutton btn-danger" type="button" value="${btn_main}"
                        onclick="location='userMain.do'">				
                </td>
            </tr>
        </table>
    </form>
    <div id="mainBottom">
        <h1> Manni는 추가 정보를 입력하면 더 나은 컨텐츠를 이용할 수 있도록 해줍니다. </h1>
    </div>
    <br><br>
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