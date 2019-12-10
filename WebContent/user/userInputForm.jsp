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
	
    <h1 class="centerText"> 지금 당장! Manni의 회원이 되세요! </h1>
    <br><br>
    <form name="inputform" method="post" action="userInputPro.do" onsubmit="return inputcheck()">    
		<input type="hidden" name="confirm" value="0">
		<input type="hidden" name="confirmNickName" value="0">       
        <table class="centerTable col-md-4" id="inputFormCss">
	            <tr>
	                <th colspan="2" class="centerText"><h2> ${msg_input} </h2></th>   
	            </tr>
                <tr>
                    <th> * ${str_id} </th>
                    <td> 
                    	<input autofocus class="form-control" type="text" name="id" maxlength="15" placeholder="example@gmail.com">
						<div id="confirmId"></div>
                    </td>
                </tr>
                <tr>
                    <th rowspan="2"> * ${str_passwd} </th>
                    <td> <input class="form-control" type="password" name="passwd" maxlength="15" placeholder="비밀번호를을 입력하세요."> </td>
                </tr>
                <tr>
					<td>
						<input class="form-control" type="password" name="repasswd" maxlength="15" placeholder="비밀번호를을 재입력하세요.">
					</td>
				</tr>
                <tr>
                    <th> * ${str_nickName} </th>
                    <td>  
                    	<input autofocus class="form-control" type="text" name="nickName" maxlength="15" placeholder="닉네임을 입력하세요.">
						<div id="confirmNickName"></div>
                    </td>
                </tr>
                <tr>
                    <th colspan="2">
                        <div class="container" style="text-align: center">
                            <button class="btn btn-primary" type="submit" style="width: 30%"> ${btn_input} </button>
                            <button class="btn btn-warning" type="reset" style="width: 30%"> ${btn_cancel} </button>
                            <button class="btn btn-danger" type="button" style="width: 30%" 
                            		onclick="location='userMain.do'"> ${btn_input_cancel} </button>
                        </div>
                    </th>
                </tr>
        </table>
    </form>
    <script>
			$("input[name=id]").on(
				"keyup",
                function(event){
					let id = $(this).val();
					
					$.ajax(
						{
							type: "POST",
							url: "userInputFormConfirmId.do",
							data: {id : id},
							dataType: "json",
							success: function(data){
							   if(data.result == 1){
								   //중복인 경우
								   $("#confirmId").html(" * 중복된 아이디입니다.").css('color', 'red');
								   inputform.confirm.value = "0";
							   }else if( data.result == -1) {
								   $("#confirmId").html(" * 이메일 형식에 맞지 않습니다.(@를 넣어주세요)").css('color', 'red');
								   inputform.confirm.value = "0";
							   }else if( data.result == -2) {
								   $("#confirmId").html(" * @는 1개만 입력가능합니다.").css('color', 'red');
								   inputform.confirm.value = "0";
							   }else if( data.result == -3 ){
								   $("#confirmId").html(" * 아이디를 입력해주세요. ").css('color', 'red');
								   inputform.confirm.value = "0";
							   }
							   else {
								   //중복이 없는 경우
								   $("#confirmId").html(" * 사용가능한 아이디입니다.").css('color', 'blue');
								   inputform.confirm.value = "1";
							   }
							   
							},
							error: function(){
							
							}
						}     
					);
				}
			);
			
			$("input[name=nickName]").on(
				"keyup",
				function(event){
					let nickName = $(this).val();
					
					$.ajax(
						{
							type: "POST",
							url: "userInputFormConfirmNickName.do",
							data: {nickName : nickName},
							dataType: "json",
							success: function(data){
								if(data.result == 1) {
									// 중복
									$("#confirmNickName").html(" * 중복된 닉네임입니다.").css('color', 'red');
									inputform.confirmNickName.value = "0";
								}else if( data.result == -1 ){
									// 입력이 없을 경우
									$("#confirmNickName").html(" * 닉네임을 입력해주세요. ").css('color', 'red');
									inputform.confirmNickName.value = "0";
								}
								else{
									// 중복아님
									$("#confirmNickName").html(" * 사용가능한 닉네임입니다.").css('color', 'blue');
									inputform.confirmNickName.value = "1";
								}
							},
							error: function(){
								
							}
							
						}
					);
				}
			);
		</script>
    <div id="mainBottom">
        <h1> Manni가 여러분의 참여를 기다리고 있습니다.</h1>
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