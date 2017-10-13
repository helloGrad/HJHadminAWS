<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>HIGRAD - ADMIN</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/press.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/organzjs/organzlist.js"></script>
<style>
        .adminbody {
            background-color: rgb(250, 250, 252);
            padding-top: 4em;
        }

        .logo {
            background-color: rgb(36, 23, 99);
        }

        a {
            text-decoration: none;
        }

        .sidebar {
            box-shadow: 5px 5px 20px rgba(51, 102, 255, 0.15), 5px 5px 20px rgba(255, 0, 0, 0.1);
        }

</style>
</head>
<body class="adminbody">
<c:import url="/WEB-INF/views/include/header.jsp" />
<div class="w3-row w3-row-padding">
    <div class=" w3-col m2 l2">
        <div class=" w3-card-2 w3-white sidebar">
            <h5 class="w3-center w3-padding-16 " style="letter-spacing: 0.3em;"><strong>모집공고 관리</strong></h5>
            <ul class="w3-ul w3-center w3-text-grey" style="letter-spacing: 0.1em;">
                <li><a href="">대학원 </a></li>
                <li><a href="">연구실 </a></li>
            </ul>

            <h5 class="w3-center w3-padding-16" style="letter-spacing: 0.3em;"><strong>기관 관리</strong></h5>
            <ul class="w3-ul w3-center w3-text-grey" style="letter-spacing: 0.1em;">
                <li><a href="">대학교 </a></li>
                <li><a href="">대학원 </a></li>
                <li><a href="">학부/학과 </a></li>
                <li><a href="">연구실 </a></li>
            </ul>


            <Br>
        </div>
    </div>


    <div class="w3-col m10 l10">
        <div class="w3-row">
            <div class="w3-large w3-card-2 w3-white">
                <h5 class="w3-padding-16">
                    <a href="" class="w3-margin-left w3-margin-right" style="letter-spacing: 0.1em;">DASHBOARD</a>
                    <i class="far fa-chevron-right"></i>
                    <a href="" class="w3-margin-left w3-text-red" style="letter-spacing: 0.1em;">기관 - 대학교</a>
                </h5>
            </div>

            <div class="w3-large w3-card-2 w3-white w3-padding-16 w3-margin-bottom">
                <div class="w3-row">
                    <h4 class="w3-center" style="letter-spacing: 0.3em;">대학교</h4>
                </div>

                <div class="w3-row">
                    <div class="w3-row-padding w3-center" style="margin-top:1px">
                    
					<c:import url="/WEB-INF/views/organz/include/charlist2.jsp" />
					                        
                    </div>
                </div>

                <div class="w3-container w3-row w3-row-padding ">
                    <!--//////////////-->
                    <div class="w3-col s12 m12 l12 w3-padding-16">
                        <div class=" w3-round-large w3-margin-bottom w3-content">
                            <!--대학원-->
                            <div id='fetchList' class="w3-ul">
                            
                            	<c:forEach items="${list }" var="list" varStatus="status">
	                            	<li class="">
	                            		<a href="${pageContext.servletContext.contextPath }/organz/updateform?no=${list.orgnzNo}&type=${list.orgnzDstnct}">
	                            			<span class="w3-medium">${list.orgnzFullNm }</span>
	                            		</a>
	                            		<c:if test="${list.orgnzDstnct=='연구실'}">
	                            			<span class="w3-tiny w3-right">연구 실적 수정하기</span>
	                            		</c:if>
	                            	</li>
                            	</c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>