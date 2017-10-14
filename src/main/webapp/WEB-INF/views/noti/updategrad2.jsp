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
                    <a href="" class="w3-margin-left w3-text-red" style="letter-spacing: 0.1em;">대학원 모집공고</a>
                </h5>
            </div>

            <div class="w3-large w3-card-2 w3-white w3-padding-16 w3-margin-bottom">
                <div class="container">
                    <div class="w3-row">
                        <h4 class="w3-margin-left" style="letter-spacing: 0.3em;">대학원 모집공고 수정 </h4>
                    </div>

                    <div id="notigrad" class="w3-row">
                        <form class="login-form" id="login-form" name="loginform" method="post"
                              enctype="multipart/form-data"
                              action="${pageContext.servletContext.contextPath }/noti/update">
                            <input type="hidden" name="tabnm" value="grad"> 
                            <input type="hidden" name="slctnNotiNo" value="${vo.slctnNotiNo }">
							<input type="hidden" name="adminNo" value="${authUser.mbNo }">

                            <div class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
                                <div class="w3-row">
                                    <div class="w3-col" style="width:150px">
                                        <label>기관번호:</label>
                                        <input class="w3-input" id="orgnzNo1" name="orgnzNo" type="text" value="${vo.orgnzNo }" readonly>
                                    </div>
                                    <div class="w3-rest">
                                        <label>기관명:</label>
                                        <input class="w3-input" id="organzinput" type="text" value="${vo.orgnzFullNm }" readonly>
                                    </div>
                                    <br>
                                    <button type="button" class="w3-button w3-blue w3-block w3-round" type='button'
                                            onclick="openOrganzSearch('대학원')">기관검색하기
                                    </button>
                                    <Br>
                                </div>

                                <div class="w3-half w3-margin-bottom">
                                    <label>모집년도:</label>
                                    <input class="w3-input" type="text" name="slctnYycl" value="${vo.slctnYycl }">
                                </div>

                                <div class="w3-half w3-margin-bottom">
                                    <label>모집학기:</label>
                                    <select class="w3-input  w3-white w3-block" name="slctnSemstr"
                                            style="height: 2.8em;">
                                        <option value="전기">전기</option>
                                        <option value="후기">후기</option>
                                        <option value="상시">상시</option>
                                    </select>
                                </div>

                                <Br>

                                <label> 제목:</label>
                                <input class="w3-input" id="slctnTitle" name="slctnTitle" type="text" value="${vo.slctnTitle }" >

                                <Br>
                                <div class="w3-row w3-row-padding w3-margin-bottom">
                                    <div class="w3-half">
                                <label>모집기간(시작):</label>
                                <input class="w3-input" id="slsnBeginDd" name="slsnBeginDd" type="text" value="${vo.slsnBeginDd }">
                                    </div>
                                    <div class="w3-half">
                                <label>모집기간(종료):</label>
                                <input class="w3-input" id="slsnEndDd" name="slsnEndDd" type="text" value="${vo.slsnEndDd }">
                                    </div>
                                </div>

                                <Br>

                                <label>대학원 모집 url:</label>
                                <input class="w3-input" id="slctnNotiUrl" name="slctnNotiUrl" type="text" value="${vo.slctnNotiUrl }">

                                <br>

                                <label>모집내용: </label>
                                <textarea class="w3-input" rows="2" id="slctnText"
                                          name="slctnText" >${vo.slctnText }</textarea>

                                <Br>

                                <div class="ui-widget">
                                    <label for="tags">학문코드</label> <br> <input class="w3-input" id="tags">
                                    <div id="duplicateMsg" style="display: none">중복입니다 !!</div>
                                    <div id="cdNmList"></div>
                                </div>
                                <br>


                                <label>전형방법:</label>
                                <textarea class="w3-input" rows="3" id="slsnMth"
                                          name="slsnMth">${vo.slsnMth }</textarea>

                                <br>


                                <label>지원자격:</label>
                                <textarea class="w3-input" rows="4" id="suprtQualf"
                                          name="suprtQualf">${vo.suprtQualf }</textarea>

                                <Br>
                            </div>

                            <div class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
                                <div class="w3-row w3-row-padding w3-margin-bottom">
                                    <div class="w3-half">
                                <label>접수기간(시작): </label>
                                <input class="w3-input" id="slctnBeginDt" name="slctnBeginDt" type="text" value="${vo.slctnBeginDt }">
                                    </div>
                                    <div class="w3-half">
                                <label>접수기간(종료): </label>
                                <input class="w3-input" id="slctnEndDt" name="slctnEndDt"
                                       type="text" value="${vo.slctnEndDt }">
                                    </div>
                                </div>

                                <label>제출서류:</label>
                                <textarea class="w3-input" rows="2" id="sbmtDocText"
                                          name="sbmtDocText">${vo.sbmtDocText }</textarea>

                                <Br>

                                <label> 원서접수: </label>
                                <textarea class="w3-input" rows="2" id="rcpMth" name="rcpMth"
                                          placeholder="접수방법">${vo.rcpMth }</textarea>

                                <Br>

                                <label> 접수 장소 : </label>
                                <textarea class="w3-input" rows="2" id="slsnPlac"
                                          name="slsnPlac">${vo.slsnPlac }</textarea>

                                <Br>

                                <label>합격자 발표 </label>
                                <label>발표일:</label>
                                <input class="w3-input" id="sccnAncmDd" name="sccnAncmDd" type="text" value="${vo.sccnAncmDd }">
                                <br>
                                <label>장소:</label>
                                <textarea class="w3-input" rows="2" id="sccnAncmMth" name="sccnAncmMth">${vo.sccnAncmMth }</textarea>
                                <Br>
                                <label> 등록기간: </label>
                                <div class="w3-row w3-row-padding w3-margin-bottom">
                                    <div class="w3-half">
                                <label>시작일:</label>
                                        <input class="w3-input" id="regstBeginDd" name="regstBeginDd" type="text" value="${vo.regstBeginDd }">
                                    </div>
                                    <div class="w3-half">
                                <label>종료일:</label>
                                        <input class="w3-input" id="regstEndDd" name="regstEndDd" type="text" value="${vo.regstEndDd }">
                                    </div>
                                </div>

                                <br>

                                <label>발표:</label>
                                <textarea class="w3-input" rows="2" id="regstMth"
                                          name="regstMth">${vo.regstMth }</textarea>

                                <br>

                            </div>

                            <div class="w3-row">
                                <h4 class="w3-margin-left" style="letter-spacing: 0.3em;">기타 정보 추가 </h4>


                                <div class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
                                    <label>광고구분:</label>
                                    <select class="w3-input  w3-white w3-block" name="pchrgYn" style="height: 3em;">
                                        <option value="Y">유료</option>
                                        <option value="N">무료</option>
                                    </select>

                                    <Br>
                                   <!--  <label> 지역 : </label>
                                    <br>
                                    <div class="w3-third w3-margin-bottom">
                                        <input class="w3-radio" type="radio" name="cdlist" id="seoul"
                                               value="AR00001"><label for="seoul">서울</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="sejong"
                                               value="AR00002"><label for="sejong">세종</label>
                                        <br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="inchon"
                                               value="AR00003"><label for="inchon">인천</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="dj"
                                               value="AR00004"><label for="dj">대전</label>
                                        <br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="dg"
                                               value="AR00005"><label for="dg">대구</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="ps"
                                               value="AR00006"><label for="ps">부산</label>
                                    </div>
                                    <div class="w3-third w3-margin-bottom">
                                        <input class="w3-radio" type="radio" name="cdlist" id="ul"
                                               value="AR00007"><label for="ul">울산</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="gw"
                                               value="AR00008"><label for="gw">광주</label>
                                        <br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="kk"
                                               value="AR00009"><label for="kk">경기</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="cb"
                                               value="AR00010"><label for="cb">충북</label>
                                        <br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="cn"
                                               value="AR00011"><label for="cn">충남</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="kw"
                                               value="AR00012"><label for="kw">강원</label>
                                    </div>
                                    <div class="w3-third w3-margin-bottom">
                                        <input class="w3-radio" type="radio" name="cdlist" id="kb"
                                               value="AR00013"><label for="kb">경북</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="kn"
                                               value="AR00014"><label for="kn">경남</label>
                                        <br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="jb"
                                               value="AR00015"><label for="jb">전북</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="jn"
                                               value="AR00016"><label for="jn">전남</label>
                                        <br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="jj"
                                               value="AR00017"><label for="jj">제주</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="br"
                                               value="AR00018"><label for="br">국외</label>
                                    </div> -->


                                </div>
                                <div class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">

                                    <label>모집인원: </label>
                                    <input class="w3-input" id="slctnNops" name="slctnNops" type="text" value="${vo.slctnNops }">
                                    <br>
                                    <label>담당자: </label>
                                    <input class="w3-input" id="chrgrNm" name="chrgrNm"
                                           type="text" value="${vo.chrgrNm }">
                                    <br>
                                    <label>전화번호: </label>
                                    <input class="w3-input" id="chrgrTelNo" name="chrgrTelNo"
                                           type="text" value="${vo.chrgrTelNo }">
                                    <br>
                                    <label>email: </label>
                                    <input class="w3-input" id="chrgrEmail" name="chrgrEmail"
                                           type="text" value="${vo.chrgrEmail }">
                                    <br>

                                    <label>로고등록: </label>
                                    <table id="filetable" cellpadding="5" cellspacing="0">
                                        <tr name="tr_attach_file">
                                            <td><input id="file" type="file" name="attachFile" multiple/></td>
                                        </tr>
                                    </table>

                                    <div id='apndngfiles'></div>

                                    <br>
                                    
                                    <button type="submit"
                                            class="w3-button w3-block w3-border w3-round-large w3-margin-bottom w3-large">모집공고 수정
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/search.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/notijs/insertnoti.js"></script>
</body>

</html>