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
	<input type="hidden" id="nickName" value="${sessionScope.nickName}">
	
    <div class="mainContent">
        <div class="row" id="mainTop">
            <div class="col-md-4">
                <img src="/Manni/Resources/img/Stream.jpg" alt="Stream" width="400" height="400">
            </div>
            <div class="col-md-5 mainText">
                <ul>
                    <h4><li> 인기 스트리머와 함께 일하는 에디터를 만나다 </li></h4><br>
                    <h4><li> "초보 스트리머도 손쉽게"…트위치, 자체 방송용 소프트웨어 공개 </li></h4><br>
                    <h4><li> 스트리머, 크리에이터를 위한 최고의 저장장치를 찾아서, 씨게이트 ... </li></h4><br>
                    <h4><li> 휠라, 스트리머 '조매력'과 콜라보레이션 에디션 인기 폭발 </li></h4><br>
                    <h4><li> 투컴 방송을 준비하는 게임 스트리머를 위한 추천 PC </li></h4>
                </ul>
            </div>
            <div class="col-md-3">
                <div class="solid">
                    <c:if test="${sessionScope.memId == null}">
	                    <h5 class="centerText">Manni는멤버에게 더 다양한<br> 서비스를 제공하고있습니다. <br> 지금 가입하세요. 
	                    <a id="link" href="userInputForm.do"> &nbsp;&nbsp;가입하기</a></h5>
	                    <br>
	                    <form name="mainform" method="post" action="userLoginPro.do?page=userMain.do" onsubmit="return maincheck()">
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
		            </c:if>
		            <c:if test="${sessionScope.memId != null}">
		            	<h5 class="centerText">Manni는 여러분을 환영합니다! <br> 여러분의 참여를 기대할게요!</h5>
						<table class="centerTable">
							<tr>
								<td style="width: 400px;" align="center">
									<span style="color: blue; font-size: 25px;">${sessionScope.nickName}</span>${msg_login_main}
								</td>
							</tr>
							<tr>	
								<td colspan="2" class="centerText">
                                    <input class="inputbutton btn-success" style="width: 40%" type="button" value="${btn_modify}"
                                            onclick="location='userModifyForm.do'">
                                    <input class="inputbutton btn-secondary" style="width: 40%" type="button" value="${btn_logout}"
                                            onclick="location='userLogout.do'"> 
                                            <br><br>
                                    <input style="width:90%" class="inputbutton btn-primary centerText" type="button" value="${btn_addinput}"
											onclick="location='userAddInputForm.do'">
											<br><br>
                                    <input class="inputbutton btn-danger" style="width: 40%" type="button" value="${btn_delete}"
                                           	onclick="location='userDeleteForm.do'">
								</td>
							</tr>
						</table>
					</c:if>
                </div>
            </div>
        </div>
    </div>
    <div id="mainBottom">
        <h1> Manni는 스트리머와 에디터가 최대한의 시너지를 낼 수 있도록 돕습니다.</h1>
    </div>
    <script type="text/javascript" src="/Manni/webSocket.js"></script>
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
	<c:if test="${sessionScope.success != null}">
		<script type="text/javascript">
			<!--
			alert( success );
			//-->
		</script>
		<c:remove var="success"/>
	</c:if>
	<c:if test="${sessionScope.addinputsuccess != null}">
		<script type="text/javascript">
			<!--
			alert( addinputsuccess );
			//-->
		</script>
	  	<c:remove var="addinputsuccess"/>
	</c:if>
</body>
</html>


