<%@page import="user.UserDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<h2> ${page_input} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( inputerror );
		//-->
	</script>
</c:if>
<c:if test="${result != 0}">
	${sessionScope.success = success }
	<c:redirect url="userMain.do"/>
</c:if>
	
	











