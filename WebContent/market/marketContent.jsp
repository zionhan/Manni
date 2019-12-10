<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting.jsp"%>
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
	

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="jumbotron">
							<h2> 나를 팝니다 </h2>
							<p> 이곳은 본인의 편집실력을 대중적으로 평가받고 다른 사람들의 편집실력을 확인해볼 수 있습니다. <br>
								마음껏  당신의 실력을 뽐내보세요. </p>
							<p>
								<a class="btn btn-primary btn-large" href="marketMain.do">Market List</a>
							</p>
						</div>

						<div class="row">
							<div class="col-md-7">
								<iframe class="col-md-12" height="300" id="urlToVideo"
									src="https://www.youtube.com/embed/f8KJe8VOwmU" allowfullscreen></iframe>
								<div class="col-md-12">
									<br> ${marketDto.mContent}
								</div>
							</div>


							<div class="col-md-5">
								<div class="col-md-12">
									<h4 class="box-title m-b-20">${marketDto.mTitle}</h4>
									<div class="panel-group" id="accordion1"
										aria-multiselectable="true" role="tablist">
										<div class="panel">
											<div class="panel-heading" id="exampleHeadingDefaultOne"
												role="tab">
												<a class="panel-title" data-toggle="collapse"
													href="#exampleCollapseDefaultOne" data-parent="#accordion1"
													aria-expanded="true"
													aria-controls="exampleCollapseDefaultOne"> 1차 컴퍼티션 </a>
											</div>
											<div class="panel-collapse collapse show"
												id="exampleCollapseDefaultOne"
												aria-labelledby="exampleHeadingDefaultOne" role="tabpanel">
												<div class="panel-body">
													보상액 : ${marketDto.mGuarantee}원<br>													 													 
													<br>
													<a id="modal-356234" href="marketPayment.do?mNum=${marketDto.mNum}"
														role="button" class="col-md-12 btn btn-primary">구매하기</a>																											
												</div>
											</div>
										</div>										
									</div>
								</div>

								<div class="col-md-12">
									<div class="white-box">
										<div class="user-bg">											
											<div class="overlay-box">
												<div class="user-content">
													<br>
													<a href="javascript:void(0)"><img
														src="https://bootdey.com/img/Content/user_3.jpg"
														class="thumb-lg img-circle" alt="img"></a>
													<h4 class="">${marketDto.nickName}</h4>
													<h5 class="">info@myadmin.com</h5>
												</div>
											</div>
										</div>	
									</div>
								</div>
							</div>
						</div>
				
					<form class="reviewForm">
						<input type="hidden" name="mNum" value="${marketDto.mNum}">						
						<div class="list-group">
							<div class="list-group-item">
								<h4 class="list-group-item-heading">
									구매가 만족스러우셨나요? 더 나은 서비스를 위해 리뷰를 작성해주세요.
								</h4>							
							    <div class="form-group">
							    	<label for="comment">Comment:</label>
							    	<textarea id="reviewArea" class="form-control" rows="5" name="rComment"></textarea>
							    	<div class="col-md-6">
									<select class="browser-default custom-select" name="rScore">
										<option value="1">★☆☆☆☆</option>
										<option value="2">★★☆☆☆</option>
										<option value="3">★★★☆☆</option>
										<option value="4">★★★★☆</option>
										<option value="5" selected>★★★★★</option>
									</select>
									</div>
									<div class="col-md-6">
										<input type="button" value="등록" class="insertReview"/>
									</div>									
								</div>										
							</div>
						</div>		
					</form>
					
					
					
					
					
					<table class="table">
						<tbody id="reviewTable">								
						<c:forEach var="reviewDto" items="${reviewList}">
						<tr>						
							<th width="100px">
								<img width="100" alt="Bootstrap Image Preview" src="https://www.layoutit.com/img/sports-q-c-140-140-3.jpg">
							</th>
							<td>
								<h5>
                           <small><fmt:formatDate value="${reviewDto.rDate}" type="both" pattern="yyyy-MM-dd"/>&nbsp;|&nbsp;</small>
                           <small>
                           <c:if test="${reviewDto.rScore==1}">★☆☆☆☆</c:if>
                           <c:if test="${reviewDto.rScore==2}">★★☆☆☆</c:if>
                           <c:if test="${reviewDto.rScore==3}">★★★☆☆</c:if>
                           <c:if test="${reviewDto.rScore==4}">★★★★☆</c:if>
                           <c:if test="${reviewDto.rScore==5}">★★★★★</c:if>
                           </small><br>   
                           <a href="#">${reviewDto.rComment}</a>                               
                        </h5>  	
								${reviewDto.nickName}												
							</td>												
						</tr>
						</c:forEach>						
						</tbody>								
					</table>	
						
						
						
						
						
						
				</div> <!--col-md-8 끝나는 곳 -->
				
				
				
				

				<div class="col-md-2"></div>	
				
					
				
				
				</div>
			</div>
		</div>
	</div>
				
	
	<div id="mainBottom">
		<h1>Manni는 스트리머와 에디터가 최대한의 시너지를 낼 수 있도록 돕습니다.</h1>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="/Manni/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteLinearNon.js"></script>
	<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteButton.js"></script>
	<script type="text/javascript" src="/Manni/discussion/js/jqueryVoteUpdate.js"></script>
		
	<script type="text/javascript">
	
	$(document).on(
		"click",
		"input[class=insertReview]",
		function(event){
			$.ajax(
				{
					type: "POST",
					url: "marketReviewPro.do",
					data: $("form[class=reviewForm]").serialize(),
					dataType: "json",
					success: function(data){
						setReviewList(data);
					$("#reviewArea").val("");  
				
					}
				}		
			);	

		}
	);
    function setReviewList(data){
      let re = "";
      let sysdate = "";
      
      for(let i=0; i<data.length; i++){
         sysdate = new Date( data[i].rDate );
         re += "<tr>";                  
         re += "<th width='100px'>";
         re += "<img width='100' alt='Bootstrap Image Preview' src='https://www.layoutit.com/img/sports-q-c-140-140-3.jpg'>";
         re += "</th>";
         re += "<td>";
         re += "<h5>";         
         re += "<small>" + date_to_str(sysdate) + "&nbsp;|&nbsp;</small>";
         re += "<small>";
                  if(data[i].rScore==1) {
                     re += "★☆☆☆☆";
                  } else if (data[i].rScore==2) {
                     re += "★★☆☆☆";
                  } else if (data[i].rScore==3) {
                     re += "★★★☆☆";
                  } else if (data[i].rScore==4) {
                     re += "★★★★☆";
                  } else {
                     re += "★★★★★";
                  }               
                  re += "</small><br>";   
                     re += "<a href='#'>" + data[i].rComment + "</a>";                               
                     re += "</h5>";   
                        re += data[i].nickName;
               re += "</td>";                                    
                  re += "</tr>";
      }
      $("#reviewTable").html(re);
   }    
    
   function date_to_str(format) {
      var year = format.getFullYear();
      var month = format.getMonth() + 1;
      if(month<10) month = '0' + month;
      var date = format.getDate();
      if(date<10) date = '0' + date;
      return year + "-" + month + "-" + date;
   }
	</script>	
</body>
</html>