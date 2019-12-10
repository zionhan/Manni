<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> Project Update pCode Page </title>
	</head>
	<body>
		<c:if test="${result==0}">
			<script type="text/javascript">
				alert( "pCode 수정에 실패했습니다." );				
			</script>		
			<meta http-equiv="refresh" content="0; url=userInfo.do">
		</c:if>
		<c:if test="${result!=0}">
			<c:redirect url="userInfo.do"/>
		</c:if>	
	</body>
</html>