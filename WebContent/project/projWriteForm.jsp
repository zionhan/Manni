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
    <script src="${project}script.js"></script>
	<script type="text/javascript" src="/Manni/jquery-3.4.1.js"></script>
</head>
<body id="fadein">
	
	<div class="container-fluid">	
			<div class="col-md-12">
				<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<h1>Project</h1>      
						<p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile-first projects on the web.</p>
					</div>				
				</div>		
			</div>	
			
			<div class="row justify-content-center">
			<div class="col-md-6">
			<div class="card">
			<header class="card-header">
				<a href="profContent.do?edNickName=${edNickName}" class="float-right btn btn-outline-primary mt-1">작성취소</a>
				<h4 class="card-title mt-2">Propose Project to ${edNickName}</h4>
			</header>
			<article class="card-body">
			<!-- <form name="projWriteForm" action="projWritePro.do" onsubmit="return projWriteCheck()"> -->
			<form name="projWriteForm" action="projWritePro.do" id="realForm">
				<input type="hidden" name="edNickName" value="${edNickName}">								
				<div class="form-group">
					<label class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="pField" value="Game">
					  <span class="form-check-label"> 게임 </span>
					</label>
					<label class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="pField" value="Sports">
					  <span class="form-check-label"> 스포츠 </span>
					</label>
					<label class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pField" value="Vlog">
						<span class="form-check-label"> Vlog </span>
					</label>
					<label class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pField" value="MukBang">
						<span class="form-check-label"> 먹방 </span>
					</label>
					<label class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pField" value="Beauty">
						<span class="form-check-label"> 뷰티 </span>
					</label>
					<label class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pField" value="Music">
						<span class="form-check-label"> 음악 </span>
					</label>
					<label class="form-check form-check-inline">
						<input class="form-check-input" type="radio" name="pField" value="Movie">
						<span class="form-check-label"> 영화 </span>
					</label>
				</div> <!-- form-group end.// -->
				<div class="form-group">
					<label>편집 스타일</label>
					<input class="form-control" type="text" value="코믹, 화끈, 박진감, 공감, 잔잔함" name="pEditStyle"/>			
				</div> <!-- form-group end.// -->
				<div class="form-row">
					<div class="col form-group">
						<label>편집 시간</label>   
						  <input id="pEditTime" type="range" class="form-control" name="pEditTime" min="0" max="30" placeholder="">				  
					</div> <!-- form-group end.// -->
					<div class="col form-group">
						<label>마감 날짜</label>
						  <input type="date" class="form-control" name="pEndDate" placeholder=" ">
					</div> <!-- form-group end.// -->
				</div> <!-- form-row end.// -->		
				<div class="form-row">					
					<div class="col form-group">
						<label>프로젝트 보상금</label>
						  <input type="text" id="compReward" class="form-control" name="pReward" placeholder="" onchange="getNumber(this);" onkeyup="getNumber(this);" style="text-align:right;">
					</div> <!-- form-group end.// -->
				</div> <!-- form-row end.// -->		
				<div class="form-group">
					<label>상세 요구 사항</label>
					<textarea class="form-control" rows="10" name="pContent" maxlength="1000" placeholder=""></textarea>
				</div> <!-- form-group end.// -->		
		
				<!-- <div class="form-group">
					<label>원본 영상 파일</label>
					<input class="form-control" type="file" name="pFile" placeholder="">
				</div> --> <!-- form-group end.// -->
				<div class="form-row">		
					<div class="col form-group">
						<input type="button" class="btn btn-primary btn-block" value="협업제안" id="submitST">
					</div>
					<div class="col form-group">
						<input type="button" class="btn btn-primary btn-block" value="Cancel" onclick="location='profContent.do?edNickName=${edNickName}'">
					</div> <!-- form-group// -->      
				</div>
				<small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our <br> Terms of use and Privacy Policy.</small>                                          
			</form>
			
			
					<!-- File Upload From -->
    <form id="upVideoForm" action="fileUpload" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
      <div class="form-group">
        <label>Select File</label> <input class="form-control" type="file" name="file" id="targetFile">
      </div>
      <!-- <div class="form-group">
        <button class="btn btn-primary" type="submit">Upload</button>
      </div> -->
      <input type="hidden" name="fCauseNum" value="${fCauseNum}">
    </form>
    <br />

    <!-- Bootstrap Progress bar -->
    <div class="progress">
      <div id="progressBar" class="progress-bar progress-bar-success" role="progressbar"
        aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">0%</div>
    </div>

    <!-- Alert -->
    <div id="alertMsg" style="color: red;font-size: 18px;"></div>
  </div>
			
			<video controls autoplay id="localVideo"></video>
			
			
			
			
			
			
			
			</article> <!-- card-body end .// -->
			<div class="border-top card-body text-center">Have an account? <a href="">Log In</a></div>
			</div> <!-- card.// -->
			</div> <!-- col.//-->			
			</div> <!-- row.//-->
			
			
			</div> 
			<!--container end.//-->
			
			<br><br>
		
		<article class="bg-secondary mb-3"> 	
			<div class="card-body text-center">
				<h3 class="text-white mt-3">Bootstrap 4 UI KIT</h3>
			<p class="h5 text-white">Components and templates  <br> for Ecommerce, marketplace, booking websites 
			and product landing pages</p>   <br>
			<p><a class="btn btn-warning" target="_blank" href="http://bootstrap-ecommerce.com/"> Bootstrap-ecommerce.com  
			<i class="fa fa-window-restore "></i></a></p>
			</div>
			<br><br>
		</article>
		
		<script src="/Manni/jquery-3.4.1.js"></script>
		<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
		<script type="text/javascript">
		var rgx1 = /\D/g;
		var rgx2 = /(\d+)(\d{3})/; 
	
		function getNumber(obj){	
			var num01;
			var num02;
			num01 = obj.value;
			num02 = num01.replace(rgx1,"");
			num01 = setComma(num02);
			obj.value =  num01;
		}
	
		function setComma(inNum){		
			var outNum;
			outNum = inNum; 
			while (rgx2.test(outNum)) {
				outNum = outNum.replace(rgx2, '$1' + ',' + '$2');
			}
			return outNum;
		}
		</script>
	
	
	
	<script>

        
        $(document).on(
        	"click",
        	"input[id=submitST]",
        	function(e){
    			compWriteCheck(e);
        	}
        );
        
        
        function compWriteCheck(e) {
        	
        	if ( !projWriteForm.pField.value ) {
        		alert( "분야를 선택하세요." );		
        		return false;
        	} 
        	else if ( !projWriteForm.pEditStyle.value ) {
        		alert( "편집스타일을 입력하세요." );
        		projWriteForm.pEditStyle.focus();
        		return false;
        	} 
        	else if ( !projWriteForm.pEditTime.value ) {
        		alert( "원하는 편집시간을 입력하세요." );
        		projWriteForm.pEditTime.focus();
        		return false;
        	} 
        	else if ( !projWriteForm.pEndDate.value ) {
        		alert ( "마감 날짜를 입력하세요." ); 
        		projWriteForm.pEndDate.focus();
        		return false;
        	} else if ( !projWriteForm.pReward.value ) {
        		alert( "금액을 입력하세요." );
        		projWriteForm.pReward.focus();
        		return false;
        	} 
        	else if ( !projWriteForm.pContent.value ) {
        		alert( "상세 요구 사항을 입력하세요." );
        		projWriteForm.pContent.focus();
        		return false;
        	} 
        	
        	else if(upVideoForm.file.value == ""){
        		alert("업로드할 동영상을 선택하세요.");
        		return false;
        	}
        	
        	let compReward = $("input[id=compReward]").val();
        	
        	var IMP = window.IMP; // 생략가능
            console.log(IMP);
        	IMP.init('imp22158909');
            // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
            // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
            IMP.request_pay({
                pg : 'kakao', // version 1.1.0부터 지원.
                //pg : 'html5_inicis', // version 1.1.0부터 지원.
                //kakao
                pay_method : 'card',
                merchant_uid : 'merchant_' + new Date().getTime(),
                // https://docs.iamport.kr/implementation/payment
                name : '맞니 결제금액',
                //결제창에서 보여질 이름
                amount : compReward,
                //가격 
                buyer_email : 'Manni@Manni.com',
                buyer_name : '맞니 스트리머',
                buyer_tel : '010-1234-5678',
                buyer_addr : '서울특별시 강남구 서초동',
                buyer_postcode : '123-456',
                //m_redirect_url : '/simple.jsp'

            }, function (rsp) {
               //alert("rsp: " + rsp);
                //console.log(rsp);
                if (rsp.success) {
                    var msg = '결제 완료';
                    //msg += '고유ID : ' + rsp.imp_uid;
                    //msg += '상점 거래ID : ' + rsp.merchant_uid;
                    //msg += '결제 금액 : ' + rsp.paid_amount;
                    //msg += '카드 승인번호 : ' + rsp.apply_num;
                    //location = "simple.jsp" //일루 가셈
                    upup(e);
                } else {
                    var msg = '결제 실패';
                    //msg += '에러내용 : ' + rsp.error_msg;
                    
                    upup(e); 
                
                }
                alert(msg);
            });
            
            
            
            
        }
        
        function upup(e){
        	//e.preventDefault();
			//Disable submit button
			$(this).prop('disabled',true);
			
			
			//var form = document.forms[0];
			var form = document.getElementById("upVideoForm");
			var formData = new FormData(form);
				
			// Ajax call for file uploaling
			var ajaxReq = $.ajax({
				url : 'fileUpload.do',
				type : 'POST',
				data : formData,
				cache : false,
				contentType : false,
				processData : false,
				xhr: function(){
					//Get XmlHttpRequest object
					 var xhr = $.ajaxSettings.xhr() ;
					
					//Set onprogress event handler 
					 xhr.upload.onprogress = function(event){
						var perc = Math.round((event.loaded / event.total) * 100);
						$('#progressBar').text(perc + '%');
						$('#progressBar').css('width',perc + '%');
					 };
					 return xhr ;
				},
				beforeSend: function( xhr ) {
					//Reset alert message and progress bar
					$('#alertMsg').text('');
					$('#progressBar').text('');
					$('#progressBar').css('width','0%');
                }
			});

			// Called on success of file upload
			ajaxReq.done(function(msg) {
				$('#alertMsg').text(msg);
				$('input[type=file]').val('');
				//$('button[type=submit]').prop('disabled',false);
				$('input[id=submitST]').prop('disabled',false);

				
				document.getElementById("realForm").submit();
			
			
			});
			
			// Called on failure of file upload
			ajaxReq.fail(function(jqXHR) {
				$('#alertMsg').text(jqXHR.responseText+'('+jqXHR.status+
						' - '+jqXHR.statusText+')');
				//$('button[type=submit]').prop('disabled',false);
				$('input[id=submitST]').prop('disabled',false);
			});
		
			
        	
        }
        
        
        //
        
        $(document).on(
        	"change",
        	"input[id='targetFile']",
        	function(){
        		var file = this.files[0]
			    var type = file.type
			    var videoNode = document.querySelector('video[id=localVideo]')
			    var canPlay = videoNode.canPlayType(type)
			    if (canPlay === '') canPlay = 'no'
			    var isError = canPlay === 'no'
	
			    if (isError) {
			      return
			    }
	
			    var fileURL = URL.createObjectURL(file)
			    videoNode.src = fileURL
        	}		
        );
        
        
    
    </script>
	
	
	</body>
</html>