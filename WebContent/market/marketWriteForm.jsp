<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			<div class="col-md-12">
				<div class="jumbotron jumbotron-fluid">
					<div class="container">
						<h1>Market Write Page</h1>      
						<p>Bootstrap is the most popular HTML, CSS, and JS framework for developing responsive, mobile-first projects on the web.</p>
					</div>				
				</div>		
			</div>	
			
			<div class="row justify-content-center">
			<div class="col-md-6">
			<div class="card">
			<header class="card-header">
				<a href="marketMain.do" class="float-right btn btn-outline-primary mt-1">작성취소</a>
				<h4 class="card-title mt-2">Register for Market</h4>
			</header>
			<article class="card-body">
			<form name="marketWriteForm" action="marketWritePro.do" onsubmit="return marketWriteCheck()">		
				<div class="form-group">
					<label>Market Title</label>
					<input type="text" class="form-control" name="mTitle" maxlength="200" placeholder="">
					<small class="form-text text-muted">We'll never share your email with anyone else.</small>
				</div> <!-- form-group end.// -->
				
				
				<div class="form-row">
					<div class="col form-group">
						<label>수수료</label>   
						  <input type="text" class="form-control" name="mGuarantee" placeholder="" onchange="getNumber(this);" onkeyup="getNumber(this);" style="text-align:right;">						
					</div> <!-- form-group end.// -->
					<div class="col form-group">
						<!-- <label>2차 보상금</label> -->
						  <input type="hidden" value="1" class="form-control" name="pReward" placeholder="" style="text-align:right;">
					</div> <!-- form-group end.// -->
				</div> <!-- form-row end.// -->		
				<div class="form-group">
					<label>상세 설명</label>
					<textarea class="form-control" rows="10" name="mContent" maxlength="1000" placeholder=""></textarea>
				</div> <!-- form-group end.// -->		
				<!-- 여기에 파일업로드 넣기 -->
				
				
				<div class="form-row">		
					<div class="col form-group">
						<input type="submit" class="btn btn-primary btn-block" value="Register">
						<!-- <input type="submit" class="btn btn-primary btn-block" value="Register" id="check_module"> -->
					</div>
					<div class="col form-group">
						<input type="button" class="btn btn-primary btn-block" value="Cancel" onclick="location='marketMain.do'">
					</div> <!-- form-group// -->      
				</div>
				<small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our <br> Terms of use and Privacy Policy.</small>                                          
			</form>
			</article> <!-- card-body end .// -->
	
			
			<div class="border-top card-body text-center">Have an account? <a href="">Log In</a></div>
			</div> <!-- card.// -->
			</div> <!-- col.//-->			
			</div> <!-- row.//-->
			
			
			
			
			</div> 
			<!--container end.//-->
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	       
	   	<div id="mainBottom">
		<h1>Manni는 스트리머와 에디터가 최대한의 시너지를 낼 수 있도록 돕습니다.</h1>
		</div>
	
	
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		<script src="/Manni/jquery-3.4.1.js"></script>	
	</body>
</html>