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


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/press.css">
<link href="${pageContext.request.contextPath}/resources/css/higrad-signup.css" rel="stylesheet">

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
<div class="w3-top">
    <div class="w3-bar w3-border logo w3-text-white">
        <div class="">
            <a href="../site-main.html" class="w3-bar-item w3-button w3-padding-16" style="letter-spacing: 0.3em;">HGN -
                ADMIN</a>
        </div>

        <button class="w3-button w3-bar-item w3-right w3-padding-16" style="letter-spacing: 0.3em;"><i
                class="far fa-sign-out"></i> 로그아웃
        </button>
        <button class="w3-button w3-bar-item w3-right w3-padding-16" style="letter-spacing: 0.3em;"><i
                class="fas fa-user"></i> ~님
        </button>

    </div>
</div>
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
                <li><a href="">대 학 </a></li>
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
                <h5 class="w3-padding-16"><a href="" class="w3-margin-left w3-text-red" style="letter-spacing: 0.1em;">DASHBOARD</a>
                </h5>
            </div>

            <div class="w3-large w3-card-2 w3-white w3-padding-16 w3-margin-bottom">
                <div class="w3-row">
                    <h6 class="w3-center" style="letter-spacing: 0.3em;">OVERVIEW</h6>
                    <div class="w3-row-padding w3-center" style="margin-top:1px">
                        <div class="w3-container w3-row w3-center w3-padding-16">
                            <div class="w3-col m2 l2 w3-text-grey">
                                <span class="w3-large">0</span>
                                <br><span class="w3-medium">대학원 모집공고</span>
                            </div>
                            <div class="w3-col m2 l2 w3-text-grey">
                                <span class="w3-large">0</span>
                                <br><span class="w3-medium">연구실 모집공고</span>
                            </div>
                            <div class="w3-col m2 l2 w3-text-grey">
                                <span class="w3-large">0</span>
                                <br><span class="w3-medium">대학</span>
                            </div>
                            <div class="w3-col m2 l2 w3-text-grey">
                                <span class="w3-large">0</span>
                                <br><span class="w3-medium">학부/학과</span>
                            </div>
                            <div class="w3-col m2 l2 w3-text-grey">
                                <span class="w3-large">0</span>
                                <br><span class="w3-medium">대학원</span>
                            </div>
                            <div class="w3-col m2 l2 w3-text-grey">
                                <span class="w3-large">0</span>
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
                            <a class="w3-col m2 l2 w3-text-grey w3-button ">
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">대학원 모집공고</span>
                            </a>
                            <a class="w3-col m2 l2 w3-text-grey w3-button  ">
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">연구실 모집공고</span>
                            </a>
                            <a class="w3-col m2 l2 w3-text-grey w3-button  ">
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">대학</span>
                            </a>
                            <a class="w3-col m2 l2 w3-text-grey w3-button  ">
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">학부/학과</span>
                            </a>
                            <a class="w3-col m2 l2 w3-text-grey w3-button ">
                                <span class="w3-large">+</span>
                                <br><span class="w3-medium">대학원</span>
                            </a>
                            <a class="w3-col m2 l2 w3-text-grey w3-button  ">
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
                                <li class="">
                                    <span class="w3-medium"><b>고려대학교 일반대학원</b> 석/박사 모집</span>
                                    <span class="w3-tiny w3-right">대학원</span>
                                </li>

                                <li class="">
                                    <span class="w3-medium"><b>경희대학교 응용물리학과 반도체광공학연구실</b> 석/박사 모집</span>
                                    <span class="w3-tiny w3-right">연구실</span>
                                </li>
                                <li class="">
                                    <span class="w3-medium"><b>경희대학교 응용물리학과 반도체광공학연구실</b> 석/박사 모집</span>
                                    <span class="w3-tiny w3-right">연구실</span>
                                </li>
                                <li class="">
                                    <span class="w3-medium"><b>경희대학교 응용물리학과 반도체광공학연구실</b> 석/박사 모집</span>
                                    <span class="w3-tiny w3-right">연구실</span>
                                </li>
                                <li class="">
                                    <span class="w3-medium"><b>경희대학교 응용물리학과 반도체광공학연구실</b> 석/박사 모집</span>
                                    <span class="w3-tiny w3-right">연구실</span>
                                </li>
                                <li class="">
                                    <span class="w3-medium"><b>경희대학교 응용물리학과 반도체광공학연구실</b> 석/박사 모집</span>
                                    <span class="w3-tiny w3-right">연구실</span>
                                </li>

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
                           
                        </div>



                    </div>
            </div>

    </div>
    </div>
</div>
    
    

</div>
    


    
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/login.js"></script>
</html>