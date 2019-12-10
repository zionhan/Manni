<%@page import="user.UserDBBean"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting.jsp" %>
<script src="${project}script.js"></script>

<h2> ${page_addinput} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		erroralert( addinputerror );
		//-->
	</script>
</c:if>
<c:if test="${result != 0}">
	${sessionScope.userGrade = userGrade}
	${sessionScope.addinputsuccess = addinputsuccess }
	<c:redirect url="userMain.do"/>
</c:if>
	