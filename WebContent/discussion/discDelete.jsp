<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<c:if test="${result != 0}">
			<c:redirect url="discussion.do"/>
		</c:if>
		<c:if test="${result == 0}">
			<script>
				alert("에러");
			</script>
		</c:if>
	</body>
</html>