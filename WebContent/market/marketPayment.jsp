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
							<h2> 주문하기 </h2>
							<p> 이곳에서 상호간에 계약을 성사시킬 수 있습니다. </p>
							<p>
								<a class="btn btn-primary btn-large" href="marketMain.do">Market List</a>
							</p>
						</div>
					<div class="row">
						<div class="col-md-3">
							<div class="white-box">
									<div class="user-bg">											
										<div class="overlay-box">
											<div class="user-content centerText">
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
						<div class="col-md-4" style="background-color: #D4F4FA">
							<br>
							<h4 class="box-title m-b-20">제목 : ${marketDto.mTitle}</h4>
							<div class="panel-group" id="accordion1"
								aria-multiselectable="true" role="tablist">
								<div class="panel">
									<div class="panel-heading" id="exampleHeadingDefaultOne"
										role="tab">
										<a class="panel-title" data-toggle="collapse"
											href="#exampleCollapseDefaultOne" data-parent="#accordion1"
											aria-expanded="true"
											aria-controls="exampleCollapseDefaultOne"> 주문정보 </a>
									</div>
									<div class="panel-collapse collapse show"
										id="exampleCollapseDefaultOne"
										aria-labelledby="exampleHeadingDefaultOne" role="tabpanel">
										<div class="panel-body">
											 금액 : ${marketDto.mGuarantee}원<br>
											 상세내용 : ${marketDto.mContent} <br>
											
											
											<div class="modal fade " id="modal-container-compJoin"
												role="dialog" aria-labelledby="myModalLabel"
												aria-hidden="true">
												<div class="modal-dialog" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="myModalLabel">정말로
																참가하시겠습니까?</h5>
															<button type="button" class="close"
																data-dismiss="modal">
																<span aria-hidden="true">×</span>
															</button>
														</div>
														<div class="modal-body">
															<form id="compJoin_form" action="compJoinPro.do">
																<input type="hidden" value="${cNum}" name="cNum" />
																<div class="col-md-2"></div>
																<div class="col-md-8">
																	<div class="form-group">
																		<label>닉네임</label> <input type="text"
																			class="form-control" name="nickName"
																			value="${sessionScope.nickName}" readonly
																			placeholder="">
																	</div>
																	<!-- form-group end.// -->
																	<div class="form-group">
																		<label>비밀번호</label> <input type="password"
																			class="form-control" name="passwd"
																			placeholder="비밀번호를 입력하세요.">
																	</div>
																	<!-- form-group end.// -->
																</div>
															</form>

														</div>
														<div class="modal-footer">
															<button id="compJoin_submit" type="button"
																class="btn btn-primary">확인</button>
															<button type="button" class="btn btn-secondary"
																data-dismiss="modal">Close</button>
														</div>
													</div>
												</div>
											</div>														
										</div>
									</div>
								</div>										
							</div>
						</div>
						<div class="col-md-5" style="background-color: #FFE08C">
							<div>
								<h3>총 결제 금액</h3>
							</div>
							<div>
								<h2 style="color: red">${marketDto.mGuarantee}원</h2>
							</div>
							<div class="centerText">
								<a id="modal-356234" href="marketBuyer.do?seller=${marketDto.nickName}&mNum=${marketDto.mNum}"
												role="button" class="col-md-12 btn btn-primary" style="width : 30%">구매하기</a>
							</div>
						</div>
					</div>
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
	</script>	
</body>
</html>