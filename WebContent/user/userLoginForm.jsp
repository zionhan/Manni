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
	
    <h1 class="centerText"> 지금 당장 Manni에 로그인하세요! </h1>
    <br><br>
    <div class="col-md-3 centerTable">
       <br>
       <div class="solid">
            <h5 class="centerText">Manni는멤버에게 더 다양한<br> 서비스를 제공하고있습니다. <br> 지금 가입하세요. 
            <a id="link" href="userInputForm.do"> &nbsp;&nbsp;가입하기</a></h5>
            <br>
            <form name="mainform" method="post" action="userLoginPro.do?page=${page}" onsubmit="return maincheck()">
             <div class="form-group">
                 <label for="id">
                   	  이메일
                 </label>
                 <input autofocus class="form-control" type="text" name="id" maxlength="15" placeholder="example@gmail.com">
             </div>
             
             <div class="form-group"> <!--form-group을 통해 form의 레이아웃을 구성해주고 label과 input을 엮어줌-->
                 <label for="password">
                    	 비밀번호
                 </label>
                 <input class="form-control" type="password" name="passwd" maxlength="15" placeholder="비밀번호를을 입력하세요."> 
             </div>
             <br>
             <div class="form-group centerText"> <!--form-group을 통해 form의 레이아웃을 구성해주고 label과 input을 엮어줌-->
                 <button class="btn btn-primary" type="submit" style="width: 50%"> 로그인 </button>
             </div>
         	</form>
      	</div>
    </div>
    
    
    <div id="mainBottom">
        <h1> Manni와 함께한다면 너무나도 즐거울 것입니다!</h1>
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