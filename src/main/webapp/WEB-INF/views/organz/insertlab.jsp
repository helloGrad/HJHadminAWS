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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/organzjs/autoCompleteSroll.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
		.ui-autocomplete {
			max-height: 100px;
			overflow-y: auto;
			overflow-x: hidden;
			padding-right: 20px;
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
                <h5 class="w3-padding-16">
                    <a href="" class="w3-margin-left w3-margin-right" style="letter-spacing: 0.1em;">DASHBOARD</a>
                    <i class="far fa-chevron-right"></i>
                    <a href="" class="w3-margin-left w3-text-red" style="letter-spacing: 0.1em;">${param.type } 관리</a>
                </h5>
            </div>

            <div class="w3-large w3-card-2 w3-white w3-padding-16 w3-margin-bottom">
                

                <div class="container">
					<div class="w3-row">
                    <h4 class="w3-margin-left" style="letter-spacing: 0.3em;">${param.type } 관리 </h4>
                	</div>
                    <div class="container">
                        <div class="w3-row">
                            <form class="login-form" id="login-form" name="loginform" method="post"
                                  action="${pageContext.servletContext.contextPath }/organz/insert?type=연구실">
                                <div class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
                                    <input type="hidden" id="tabnm" name="tabnm" value="lab">
                                    <input type="hidden" id="type" name="type" value="${param.type }">
                                    <input type="hidden" class="form-control" id="orgnzDstnct" name="orgnzDstnct"
                                           value="연구실" readonly>
                                    <label>기관명:</label>
                                    <input class="w3-input" type="text" class="form-control" id="orgnzNm"
                                           name="orgnzNm">
                                    <br>
                                    <label>기관영문명 :</label>
                                    <input class="w3-input" type="text" class="form-control" id="engOrgnzNm"
                                           name="engOrgnzNm">
                                    <br>
                                    <label>지도교수명:</label>
                                    <input type="text" class="w3-input" id="mapProfNm" name="mapProfNm">
                                    <br>
                                    <label> 연구실 소개:</label>
                                    <textarea class="w3-input" onkeydown="resize(this)"
                                              onkeyup="resize(this)" id="labIntro" name="labIntro"></textarea>
                                    <br>
                                    <label>연구원 수(박사/석박사/석사):</label>
                                    <input type="text" class="w3-input" id="rsrchrInfoText" name="rsrchrInfoText">
                                    <br>
                                    <label>상징색상명:</label>
                                    <input type="text" class="w3-input" id="symbolColorNm" name="symbolColorNm"> <br>
                                    <label>홈페이지 주소 :</label>
                                    <input class="w3-input" type="text" class="form-control" id="hmpageUrl"
                                           name="hmpageUrl">
                                    <br>
                                    <label>전화번호 :</label>
                                    <input class="w3-input" type="text" class="form-control" id="telNo" name="telNo">
                                    <br>
                                    <label>팩스번호 :</label>
                                    <input class="w3-input" type="text" class="form-control" id="faxNo" name="faxNo">
                                    <br>
                                    <label> 주소 :</label>
                                    <input class="w3-input" type="text" class="form-control" id="addr" name="addr">
                                    <br>
                                    <label>상세주소 :</label>
                                    <input type="text" class="w3-input" id="detailAddr" name="detailAddr">
                                    <br>
                                </div>

                                <div class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
                                    <label>국내외 구분:</label>
                                    <select class="w3-input  w3-white" id="hmnbrdDstnct" name="hmnbrdDstnct" style="height: 2.7em;">
                                        <option value="국내">국내</option>
                                        <option value="국외">국외</option>
                                    </select>
                                    <br>
                                    <div class="w3-row-padding">
                                        <label> 지역 : </label>
                                        <br>
                                        <div class="w3-third">
                                            <input class="w3-radio" type="radio" name="cdlist" id="seoul"
                                                   value="AR00001"><label for="seoul">서울 </label>
                                            <input class="w3-radio" type="radio" name="cdlist" id="sejong"
                                                   value="AR00002"><label for="sejong">세종 </label>
                                            <br>
                                            <input class="w3-radio" type="radio" name="cdlist" id="inchon"
                                                   value="AR00003"><label for="inchon">인천 </label>
                                            <input class="w3-radio" type="radio" name="cdlist" id="dj"
                                                   value="AR00004"><label for="dj">대전 </label>
                                            <br>
                                            <input class="w3-radio" type="radio" name="cdlist" id="dg"
                                                   value="AR00005"><label for="dg">대구 </label>
                                            <input class="w3-radio" type="radio" name="cdlist" id="ps"
                                                   value="AR00006"><label for="ps">부산 </label>
                                        </div>
                                        <div class="w3-third">
                                            <input class="w3-radio" type="radio" name="cdlist" id="ul"
                                                   value="AR00007"><label for="ul">울산 </label>
                                            <input class="w3-radio" type="radio" name="cdlist" id="gw"
                                                   value="AR00008"><label for="gw">광주&nbsp;</label>
                                            <br>
                                            <input class="w3-radio" type="radio" name="cdlist" id="kk"
                                                   value="AR00009"><label for="kk">경기&nbsp;</label>
                                            <input class="w3-radio" type="radio" name="cdlist" id="cb"
                                                   value="AR00010"><label for="cb">충북&nbsp;</label>
                                            <br>
                                            <input class="w3-radio" type="radio" name="cdlist" id="cn"
                                                   value="AR00011"><label for="cn">충남&nbsp;</label>
                                            <input class="w3-radio" type="radio" name="cdlist" id="kw"
                                                   value="AR00012"><label for="kw">강원&nbsp;</label>
                                        </div>
                                        <div class="w3-third">
                                            <input class="w3-radio" type="radio" name="cdlist" id="kb"
                                                   value="AR00013"><label for="kb">경북 </label>
                                            <input class="w3-radio" type="radio" name="cdlist" id="kn"
                                                   value="AR00014"><label for="kn">경남&nbsp;</label>
                                            <br>
                                            <input class="w3-radio" type="radio" name="cdlist" id="jb"
                                                   value="AR00015"><label for="jb">전북&nbsp;</label>
                                            <input class="w3-radio" type="radio" name="cdlist" id="jn"
                                                   value="AR00016"><label for="jn">전남 </label>
                                            <br>
                                            <input class="w3-radio" type="radio" name="cdlist" id="jj"
                                                   value="AR00017"><label for="jj">제주 </label>
                                            <input class="w3-radio" type="radio" name="cdlist" id="br"
                                                   value="AR00018"><label for="br">국외&nbsp;</label>
                                        </div>
                                    </div>
                                    <Br>
                                    <div class="form-group">
                                        <label> 학위 :</label>
                                        <br>
                                        <input class="w3-check" type="checkbox" name="cdlist" value="DE00001">석사&nbsp;
                                        <input class="w3-check" type="checkbox" name="cdlist" value="DE00002">박사&nbsp;
                                        <input class="w3-check" type="checkbox" name="cdlist" value="DE00003">석박사통합&nbsp;
                                    </div>

                                    <br>

                                    <div id="organzinfo">
                                        <div class="form-group">
                                            <label>부모기관번호</label>
                                            <input class="w3-input" id="orgnzNo1" name="prntsOrgnzNo" type="text"
                                                   readonly>
                                        </div>
                                        <Br>
                                        <div class="form-group">
                                            <label>부모기관명</label>
                                            <input class="w3-input" id="organzinput" name="orgnzFullNm" type="text"
                                                   readonly>
                                            <br>
                                            <button type="button" class="w3-button w3-blue w3-block w3-round" onclick="openOrganzSearch('학과')">기관검색하기
                                            </button>
                                        </div>
                                    </div>
                                    <br>

                                    <!-- 맞춤정보 입력란 -->
                                    <div class="ui-widget">
                                        <label for="tags">연구분야: </label> <input class="w3-input" id="tags" required>
                                        <div id="duplicateMsg" style="display: none">중복입니다 !!</div>
                                        <div id="cdNmList"></div>
                                    </div>

                                    <br>
                                    
                                    <button type="submit"
                                            class="w3-button w3-block w3-border w3-round-large w3-margin-bottom w3-large"
                                            style="letter-spacing: 2px;">입력
                                    </button>
                                </div>
                            </form>
                        </div>
                        <div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/file.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>
	
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad2.js"></script>

</body>

</html>