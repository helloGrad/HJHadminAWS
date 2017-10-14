<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>HIGRAD - ADMIN</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/press.css">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	
    <c:import url="/WEB-INF/views/include/side.jsp" />
    
    <div class="w3-col m10 l10">
        <div class="w3-row">
            <div class="w3-large w3-card-2 w3-white">
                <h5 class="w3-padding-16"><a href="" class="w3-margin-left w3-text-red" style="letter-spacing: 0.1em;">DASHBOARD</a>
                </h5>
            </div>

            <div class="w3-large w3-card-2 w3-white w3-padding-16 w3-margin-bottom">
                <div class="w3-row">
                    <h6 class="w3-center" style="letter-spacing: 0.3em;">OVERVIEW</h6>
                    <div class="w3-row-padding w3-center" style="margin-top:1px">
                        <div class="w3-container w3-row w3-center w3-padding-16">
                        
                            <div class="w3-col m2 l2 w3-text-grey">
                            	<c:forEach items="${countList }" var="countList">
                            		<c:if test="${countList.orgnzNm =='대학원 모집공고' }">
                            			<span class="w3-large">${countList.orgnzNo}</span>
                            		</c:if>
                            	</c:forEach>
                                <br><span class="w3-medium">대학원 모집공고</span>
                            </div>
                            
                            <div class="w3-col m2 l2 w3-text-grey">
                                <c:forEach items="${countList }" var="countList">
                            		<c:if test="${countList.orgnzNm =='연구실 모집공고' }">
                            			<span class="w3-large">${countList.orgnzNo}</span>
                            		</c:if>
                            	</c:forEach>
                                <br><span class="w3-medium">연구실 모집공고</span>
                            </div>
                            
                            <div class="w3-col m2 l2 w3-text-grey">
                                <c:forEach items="${countList }" var="countList">
                            		<c:if test="${countList.orgnzNm =='대학교' }">
                            			<span class="w3-large">${countList.orgnzNo}</span>
                            		</c:if>
                            	</c:forEach>
                                <br><span class="w3-medium">대학</span>
                            </div>
                            
                            <div class="w3-col m2 l2 w3-text-grey">
                                <c:forEach items="${countList }" var="countList">
                            		<c:if test="${countList.orgnzNm =='학과' }">
                            			<span class="w3-large">${countList.orgnzNo}</span>
                            		</c:if>
                            	</c:forEach>
                                <br><span class="w3-medium">학부/학과</span>
                            </div>
                            
                            <div class="w3-col m2 l2 w3-text-grey">
                                <c:forEach items="${countList }" var="countList">
                            		<c:if test="${countList.orgnzNm =='대학원' }">
                            			<span class="w3-large">${countList.orgnzNo}</span>
                            		</c:if>
                            	</c:forEach>
                                <br><span class="w3-medium">대학원</span>
                            </div>
                            
                            <div class="w3-col m2 l2 w3-text-grey">
                                <c:forEach items="${countList }" var="countList">
                            		<c:if test="${countList.orgnzNm =='연구실' }">
                            			<span class="w3-large">${countList.orgnzNo}</span>
                            		</c:if>
                            	</c:forEach>
                                <br><span class="w3-medium">연구실</span>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="w3-large w3-card-2 w3-white w3-padding-16 w3-margin-bottom">
                <div class="w3-row ">
                    <h6 class="w3-center" style="letter-spacing: 0.3em;">ADD</h6>
                    <div class=" w3-center" style="margin-top:1px">
                        <div class="w3-container w3-row w3-center w3-padding-16">
                            <a class="w3-col m2 l2 w3-text-grey w3-button " href="${pageContext.servletContext.contextPath }/noti/insert?type=대학원" >
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">대학원 모집공고</span>
                            </a>
                            <a class="w3-col m2 l2 w3-text-grey w3-button  " href="${pageContext.servletContext.contextPath }/noti/insert?type=연구실">
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">연구실 모집공고</span>
                            </a>
                            <a class="w3-col m2 l2 w3-text-grey w3-button  " href="${pageContext.servletContext.contextPath }/organz/insertform?type=대학교">
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">대학</span>
                            </a>
                            <a class="w3-col m2 l2 w3-text-grey w3-button  " href="${pageContext.servletContext.contextPath }/organz/insertform?type=학과">
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">학부/학과</span>
                            </a>
                            <a class="w3-col m2 l2 w3-text-grey w3-button " href="${pageContext.servletContext.contextPath }/organz/insertform?type=대학원">
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">대학원</span>
                            </a>
                            <a class="w3-col m2 l2 w3-text-grey w3-button  " href="${pageContext.servletContext.contextPath }/organz/insertform?type=연구실">
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">연구실</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="w3-large w3-card-2 w3-white w3-padding-16 w3-margin-bottom">
                <div class="w3-row">
                    <h6 class="w3-center" style="letter-spacing: 0.3em;">LATEST CONTENTS</h6>
                </div>

                <div class="w3-container w3-row w3-row-padding ">
                    <!--//////////////-->
                    <div class="w3-col s12 m6 l6 w3-padding-16">
                        <div class="w3-row w3-margin-bottom">
                            <div  class="w3-border-bottom w3-border-black">
                                <h3>
                                    	모집공고
                                </h3>
                            </div>
                        </div>

                        <div class=" w3-round-large w3-margin-bottom w3-content" >
                            <!--대학원-->
                            <div class="w3-ul">
                            	<c:forEach items="${notiList }" var="notiList">
                            		<li class="">
                            		<a href="${pageContext.servletContext.contextPath }/noti/update?no=${notiList.slctnNotiNo}&tabnm=${notiList.slctnNotiDstnct}">
                                    	<span class="w3-medium"><b>${notiList.orgnzFullNm }</b> ${notiList.slctnTitle }</span>
                                    	<span class="w3-tiny w3-right">${notiList.slctnNotiDstnct }</span>
                                    </a>
                                	</li>
                            	</c:forEach>
                            

                            </div>
                        </div>


                    </div>

                    <!--//////////////-->
                    <div class="w3-col s12 m6 l6 w3-row w3-padding-16">
                        <div class="w3-row w3-margin-bottom">
                            <div class=" w3-border-bottom w3-border-black">
                                <h3>
                                    	기관
                                </h3>
                            </div>
                        </div>
                        
                        
                        
                        <div class=" w3-round-large w3-margin-bottom w3-content">
                        	<div class="w3-ul">
	                           <c:forEach items="${organzList }" var="organzList">
	                            		<li class="">
	                            		<a href="${pageContext.servletContext.contextPath }/organz/updateform?no=${organzList.orgnzNo}&type=${organzList.slctnNotiDstnct}">
	                                    	<span class="w3-medium"><b>${organzList.orgnzFullNm }</b></span>
	                                    	<span class="w3-tiny w3-right">${organzList.slctnNotiDstnct }</span>
	                                    </a>
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
    


<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script> 
</body>
</html>