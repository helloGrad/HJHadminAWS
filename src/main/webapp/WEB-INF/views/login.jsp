<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link href="${pageContext.request.contextPath}/resources/css/higrad-signup.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/w3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/press.css" rel="stylesheet">
<style>
    body {
        background-color: rgb(250, 250, 252);
    }
    .logo {
        background-color: rgb(0, 0, 77);
    }
</style>

</head>
<body>

<div class="w3-top">
    <div class="w3-bar w3-border w3-text-white logo">
        <div class="container">
            <a href="site-main.html" class="w3-bar-item w3-button w3-padding-16">HGN</a>
        </div>
    </div>
</div>

<div class="w3-row" style="padding-top: 9em;">
    <div class="container w3-padding-64">
        <div class="w3-content" style="max-width: 488px;">
            <form id="login-form" name="loginform" class="w3-card-4 w3-white" method="post" action="${pageContext.servletContext.contextPath }/user/auth">
                <header class="w3-text-white" style="background: linear-gradient(131deg,rgba(153, 0, 0, 0.65), rgba(0, 0, 153, 0.65), rgba(0,153,0,0.65) );">
                    <div class="w3-padding">
                    <h3>HIGRAD NET</h3>
                    </div>
                </header>
                <div class="w3-container">
                <p>
                    <input class="w3-input" name="iden" type="text" style="width:100%" placeholder="Enter email" required>
                    <label>ID</label></p>
                <p>
                    <input class="w3-input" name="pw" type="password" style="width:100%" placeholder="Enter password" required>
                    <label>Password</label></p>

                <p>
                
                <c:if test='${result == "fail" or param.result=="fail"}'>
							<p style="color:red">로그인에 실패했습니다.</p>
				</c:if>
                    <button class="w3-button w3-section w3-teal w3-ripple w3-right"> Log in </button></p>
                </div>
            </form>
        </div>
    </div>
</div>
	

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>

</body>
</html>