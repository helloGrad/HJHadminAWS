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

<c:if test="${vo.orgnzDstnct=='학과' }">
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad2.js"></script>
</c:if>

<script type="text/javascript">
	$(function() {
		
		
		$("#hmnbrdDstnct").val("${vo.hmnbrdDstnct}").attr("selected",
				"selected");
		$("#orgnzDstnct").val("${vo.orgnzDstnct}").attr("selected", "selected");

		$("textarea.autosize").on('keydown keyup', function() {
			$(this).height(1).height($(this).prop('scrollHeight') + 12);
		});
		
		var codeList = JSON.parse('${codeList}');
		codeList1 = JSON.parse('${codeList1}'); 
		codeList2 = JSON.parse('${codeList2}'); 
		var type2 = $("#type").val();

		

		if (type2 === '학과') {
			
			if (codeList1.length != 0) {
				
				console.log("null아닐 때");
				console.log(codeList1.length);
				$("#cdNmList")
						.append(
								"<div id='"
							+ codeList1[0].cdId
							+ "'><span id='cdNm' name='cdNm' val='"
							+ codeList1[0].cdNm
							+ "'>"
										+ codeList1[0].cdNm
										+ "</span>"
										+ "<button id='deleteBtn' type='button' onclick='clickDelete(\""
										+ codeList1[0].cdId
										+ "\");' class='btn'>X</button>"
										+ "<input type='hidden' name='codes[" + 0
							+ "].cdId' value='" + codeList1[0].cdId + "'>"
										+ "<input type='hidden' name='codes[" + 0
							+ "].cdNm' value='" + codeList1[0].cdNm + "'>"
										+ "</div>")
				index++;
				checkList.push(codeList1[0].cdNm);
			}
				
			for (var i = 0; i < codeList2.length; i++) {
				$("#cdNmList2")
						.append(
								"<div id='"
										+ codeList2[i].cdId
										+ "'><span id='cdNm' name='cdNm' val='"
										+ codeList2[i].cdNm
										+ "'>"
										+ codeList2[i].cdNm
										+ "</span>"
										+ "<button id='deleteBtn' type='button' onclick='clickDelete(\""
										+ codeList2[i].cdId
										+ "\");' class='btn'>X</button>"
										+ "<input type='hidden' name='codes2["
										+ index2 + "].cdId' value='"
										+ codeList2[i].cdId + "'>"
										+ "<input type='hidden' name='codes2["
										+ index2 + "].cdNm' value='"
										+ codeList2[i].cdNm + "'>"
										+ "</div>")
				checkList.push(codeList2[i].cdNm);
				index2++;
			}

		} else {
			$('input:checkbox[name="cdlist"]').each(function() {
				console.log(codeList.length);

				for (var i = 0; i < codeList.length; i++) {
					if (codeList[i].cdId == this.value) {
						console.log(codeList[i].cdId);
						this.checked = true; 
					}
				}
			});
			
			$('input:radio[name="cdlist"]').each(function() {
				console.log(codeList.length);

				for (var i = 0; i < codeList.length; i++) {
					if (codeList[i].cdId == this.value) {
						console.log(codeList[i].cdId);
						this.checked = true; 
					}
				}
			});
		}
		
		
	})
	
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (20 + obj.scrollHeight) + "px";
	}
</script>

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
                    <div class="w3-row">

                        <form class="updateform" id="updateform" name="updateform"
                              method="post" enctype="multipart/form-data"
                              action="${pageContext.servletContext.contextPath }/organz/update">
                              <input type="hidden" id="type" name="type"
								value="${vo.orgnzDstnct }"> <input type="hidden"
								id="orgnzNo" name="orgnzNo" value="${vo.orgnzNo }">
                            <div class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
                                <input type="hidden" id="type" name="type" value="${param.type }">
                                <input type="hidden" class="w3-input" id="orgnzDstnct" name="orgnzDstnct" value="${vo.orgnzDstnct }" readonly>
                               
                                <label>기관명:</label>
                                <input type="text" class="w3-input" id="orgnzNm" name="orgnzNm" value="${vo.orgnzNm }">
                                <br>
                                <label>기관영문명:</label>
                                <input type="text" class="w3-input" id="engOrgnzNm" name="engOrgnzNm" value="${vo.engOrgnzNm }">
                                <br>
                                <label>상징색상명:</label>
                                <input type="text" class="w3-input" id="symbolColorNm" name="symbolColorNm" value="${vo.symbolColorNm }">
                                <br>
                                <label>홈페이지주소:</label>
                                <input type="text" class="w3-input" id="hmpageUrl" name="hmpageUrl" value="${vo.hmpageUrl }">
                                <br>
                                <label>전화번호:</label>
                                <input type="text" class="w3-input" id="telNo" name="telNo" value="${vo.telNo }">
                                <br>
                                <label>팩스번호:</label>
                                <input type="text" class="w3-input" id="faxNo" name="faxNo" value="${vo.faxNo }">
                                <br>
                                <label>주소:</label>
                                <input type="text" class="w3-input" id="addr" name="addr" value="${vo.addr }">
                                <br>
                                <label>상세주소:</label>
                                <input type="text" class="w3-input" id="detailAddr" name="detailAddr" value="${vo.detailAddr }">
                                <br>

                            </div>
                            <div class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
                                <label>국내외 구분:</label>
                                <select class="w3-input w3-select w3-white" id="hmnbrdDstnct" name="hmnbrdDstnct" style="height: 2.7em;">
                                    <option value="국내">국내</option>
                                    <option value="국외">국외</option>
                                </select>
                                <c:if test="${param.type == '대학원' }">
                                    <br>
                                    <label>대학원 구분: ${vo.grschDstnct}</label>
                                    <select class="w3-input w3-select w3-white" id="grschDstnct" name="grschDstnct" style="height: 2.7em;">
                            <c:if test="${vo.grschDstnct=='일반대학원' }">
								<option value="일반대학원" selected="selected">일반대학원</option>
								<option value="전문대학원">전문대학원</option>
								<option value="특수대학원">특수대학원</option>
							</c:if>
							<c:if test="${vo.grschDstnct=='전문대학원' }">
								<option value="일반대학원">일반대학원</option>
								<option value="전문대학원" selected="selected">전문대학원</option>
								<option value="특수대학원">특수대학원</option>
							</c:if>
							<c:if test="${vo.grschDstnct=='특수대학원' }">
								<option value="일반대학원">일반대학원</option>
								<option value="전문대학원">전문대학원</option>
								<option value="특수대학원" selected="selected">특수대학원</option>
							</c:if>
                                    </select>

                                </c:if>
                                <Br>

                                <c:if test="${param.type == '대학원' }">
                                    <div class="w3-row-padding">
                                        <label> 지역 : </label>
                                        <br>
                                        <div class="w3-third">
                                        <input class="w3-radio" type="radio" name="cdlist" id="seoul" value="AR00001"><label for="seoul">서울</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="sejong" value="AR00002"><label for="sejong">세종</label><br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="inchon" value="AR00003"><label for="inchon">인천</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="dj" value="AR00004"><label for="dj">대전</label><br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="dg" value="AR00005"><label for="dg">대구</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="ps" value="AR00006"><label for="ps">부산</label><br>
                                        </div>
                                        <div class="w3-third">
                                        <input class="w3-radio" type="radio" name="cdlist" id="ul" value="AR00007"><label for="ul">울산</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="gw" value="AR00008"><label for="gw">광주</label><br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="kk" value="AR00009"><label for="kk">경기</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="cb" value="AR00010"><label for="cb">충북</label><br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="cn" value="AR00011"><label for="cn">충남</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="kw" value="AR00012"><label for="kw">강원</label><br>
                                        </div>
                                        <div class="w3-third">
                                        <input class="w3-radio" type="radio" name="cdlist" id="kb" value="AR00013"><label for="kb">경북</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="kn" value="AR00014"><label for="kn">경남</label><br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="jb" value="AR00015"><label for="jb">전북</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="jn" value="AR00016"><label for="jn">전남</label><br>
                                        <input class="w3-radio" type="radio" name="cdlist" id="jj" value="AR00017"><label for="jj">제주</label>
                                        <input class="w3-radio" type="radio" name="cdlist" id="br" value="AR00018"><label for="br">국외</label><br>
                                        </div>
                                    </div>

                                    <br>

                                    <div class="form-group">
                                        <label> 학위 :</label>
                                        <br>
                                        <input class="w3-check" type="checkbox" name="cdlist" value="DE00001">석사&nbsp;
                                        <input class="w3-check" type="checkbox" name="cdlist" value="DE00002">박사&nbsp;
                                        <input class="w3-check" type="checkbox" name="cdlist" value="DE00003">석박사통합&nbsp;
                                    </div>
                                    <br>
                                </c:if>

                                <c:if test="${param.type == '학과' || param.type == '대학원'}">

                                    <div class="form-group">
                                        <label>부모 기관번호:</label>
                                        <input class="w3-input" id="orgnzNo1" name="prntsOrgnzStr"
                                               type="text" value="${vo.prntsOrgnzNo }" readonly>
                                    </div>
                                    <br>
                                    <div class="form-group">
                                        <label>부모 기관명:</label>
                                        <input class="w3-input" id="organzinput" name="orgnzFullNm" type="text" value="${vo.orgnzFullNm }" readonly>

                                        <c:choose>
                                            <c:when test="${param.type=='대학원' }">
                                                <button class="w3-button w3-blue" type='button'
                                                       onclick="openOrganzSearch('대학교');">기관검색하기
                                                </button>
                                            </c:when>
                                            <c:when test="${param.type=='학과' }">
                                                <button class="w3-button w3-blue" type='button'
                                                       onclick="openOrganzSearch('대학원');">기관검색하기
                                                </button>
                                            </c:when>
                                        </c:choose>

                                    </div>
                                </c:if>

                                <c:choose>
                                    <c:when test="${param.type == '학과' }">
                                        <br>
                                        <div class="ui-widget">
                                            <label for="tags">학과/학부코드 : </label>
                                            <input class="w3-input" id="tags">
                                            <div id="duplicateMsg" style="display: none">중복입니다 !!</div>
                                            <div id="cdNmList"></div>
                                        </div>
                                        <br>
                                        <div class="ui-widget">
                                            <label for="tags2">세부전공코드 : </label>
                                            <input class="w3-input" id="tags2">
                                            <div id="duplicateMsg2" style="display: none">중복입니다 !!</div>
                                            <div id="cdNmList2"></div>
                                        </div>

                                        <br>
                                        <label><input class="w3-check" name="aboltYn" type="checkbox" value="Y"> 폐지여부</label>
                                        <br>
                                        <br>
                                    </c:when>
                                    <c:otherwise>
                                        <input type='hidden' name='codes2[0].cdId' value='-1'>
                                        <input type='hidden' name='codes[0].cdId' value='-1'>
                                    </c:otherwise>
                                </c:choose>

                                <br>
                                <button type="submit" class="w3-button w3-block w3-border w3-round-large w3-margin-bottom w3-large"
                                        style="letter-spacing: 2px;">입력
                                </button>
                            </div>


                        </form>
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