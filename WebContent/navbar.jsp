<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<nav class="navbar navbar-expand-xl navbar-dark topContent">
        <!--브랜드 로고-->
        <a id="link" href="userMain.do" class="navbar-brand" ><img src="/Manni/Resources/img/teeth2.png" alt="Manni" width="60" height="60" style="background-color: white">  Manni </a>
        <!--햄버거 버튼-->
        <button class="navbar-toggler" data-toggle="collapse" data-target="#myNavbar">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-left" id="myNavbar">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" id="link" href="compList.do">Competition</a></li>
                <li class="nav-item"><a class="nav-link" id="link" href="marketMain.do" >Market</a></li>
                <li class="nav-item"><a class="nav-link" id="link" href="discussion.do">Discussion</a></li>
                <li class="nav-item"><a class="nav-link" id="link" href="rankList.do?preferJob=0">Rank</a></li>
            </ul>
</div>
        <div class="collapse navbar-collapse justify-content-left" id="myNavbar">
            <ul class="navbar-nav">
                <li class="dropdown show open">
                	<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="true"> <!-- 알람사이트에 가야함 -->
                		<i class="far fa-envelope">
                			<span class="notify">
                			</span>
                		</i>
                	</a>
                	<ul class="dropdown-menu dropdown-user animated flipInY" id="realAlarm">
                     </ul>
                </li>
                
                <li class="dropdown show open">
                	<a class="dropdown-toggle profile-pic" data-toggle="dropdown" href="#" aria-expanded="true">
						<i class="fas fa-user-circle"></i>
					</a>
                     <ul class="dropdown-menu dropdown-user animated flipInY">
                         <li><a id="link" href="userInfo.do"><i class="far fa-user"></i> My Info </a></li>
                         <li><a id="link" href="#"><i class="fas fa-coins"></i> My Balance</a></li>
                         <c:if test="${sessionScope.memId == null}">
                         	<li><a id="link" href="userLoginForm.do?page=userMain.do"><i class="fa fa-power-off"></i> Login</a></li>
                         </c:if>
                         <c:if test="${sessionScope.memId != null}">
                         	<li><a id="link" href="userLogout.do"><i class="fa fa-power-off"></i> Logout</a></li>
                         </c:if>
                     </ul>
                 </li>
            </ul>
        </div>
    </nav>
    <br><br><br>

</body>
</html>