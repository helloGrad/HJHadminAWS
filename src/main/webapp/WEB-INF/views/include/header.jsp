<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<div class="w3-top">
    <div class="w3-bar w3-border logo w3-text-white">
        <div class="">
            <a href="${pageContext.servletContext.contextPath }/" class="w3-bar-item w3-button w3-padding-16" style="letter-spacing: 0.3em;">HGN -
                ADMIN</a>
        </div>

        <a href="${pageContext.servletContext.contextPath }/user/logout">
	        <button class="w3-button w3-bar-item w3-right w3-padding-16" style="letter-spacing: 0.3em;"><i
	                class="far fa-sign-out"></i> 로그아웃
	        </button>
        </a>
        <button class="w3-button w3-bar-item w3-right w3-padding-16" style="letter-spacing: 0.3em;"><i
                class="fas fa-user"></i> ${authUser.nknm }님 반갑습니다
        </button>

    </div>
</div>

</html>
