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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/w3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/press.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/organzjs/autoCompleteSroll.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/insertgrad2.js"></script>



<script type="text/javascript">
	$(function() {
		
		
		$("#hmnbrdDstnct").val("${vo.hmnbrdDstnct}").attr("selected",
				"selected");
		//$("#orgnzDstnct").val("${vo.orgnzDstnct}").attr("selected", "selected");

		$("textarea.autosize").on('keydown keyup', function() {
			$(this).height(1).height($(this).prop('scrollHeight') + 12);
		});
		
		var codeList = JSON.parse('${codeList}');
		codeList1 = JSON.parse('${codeList1}'); 
		codeList2 = JSON.parse('${codeList2}');
		codeList3 = JSON.parse('${codeList3}');
		var type2 = $("#type").val();
		
 		if(type2 === '연구실'){
			for (var i = 0; i < codeList3.length; i++) {
				$("#cdNmList")
						.append(
								"<div id='"
										+ codeList3[i].cdId
										+ "'><span id='cdNm' name='cdNm' val='"
										+ codeList3[i].cdNm
										+ "'>"
										+ codeList3[i].cdNm
										+ "</span>"
										+ "<button id='deleteBtn' type='button' onclick='clickDelete(\""
										+ codeList3[i].cdId
										+ "\");' class='btn'>X</button>"
										+ "<input type='hidden' name='codes["
										+ index + "].cdId' value='"
										+ codeList3[i].cdId + "'>"
										+ "<input type='hidden' name='codes["
										+ index + "].cdNm' value='"
										+ codeList3[i].cdNm + "'>"
										+ "</div>")
										index++;
				checkList.push(codeList3[i].cdNm);
				
		}
 		}
		

		if (type2 === '학과') {

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
	box-shadow: 5px 5px 20px rgba(51, 102, 255, 0.15), 5px 5px 20px
		rgba(255, 0, 0, 0.1);
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
						<a href="" class="w3-margin-left w3-margin-right"
							style="letter-spacing: 0.1em;">DASHBOARD</a> <i
							class="far fa-chevron-right"></i> <a href=""
							class="w3-margin-left w3-text-red" style="letter-spacing: 0.1em;">${param.type }
							관리</a>
					</h5>
				</div>

				<div
					class="w3-large w3-card-2 w3-white w3-padding-16 w3-margin-bottom">

					<div class="container">
						<div class="w3-row">
							<h4 class="w3-margin-left" style="letter-spacing: 0.3em;">${param.type }
								관리</h4>
						</div>
						<div class="w3-row">

							<form class="updateform" id="updateform" name="updateform"
								method="post" enctype="multipart/form-data"
								action="${pageContext.servletContext.contextPath }/organz/update">
								<input type="hidden" class="w3-input" id="orgnzDstnct" name="orgnzDstnct" value="${organzLabList.orgnzDstnct }" readonly>
								<input
									type="hidden" id="orgnzNo" name="orgnzNo"
									value="${organzLabList.orgnzNo }">
								<div class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
									<input type="hidden" id="type" name="type"
										value="${param.type }"> 
									
									<input type="hidden" id="orgnzNo" name="orgnzNo" value="${organzLabList.orgnzNo }"> 
									<label>기관명:</label>
                                    <input class="w3-input" type="text" class="form-control" id="orgnzNm"
                                           name="orgnzNm" value="${organzLabList.orgnzNm }">
                                    <br>
                                    <label>기관영문명 :</label>
                                    <input class="w3-input" type="text" class="form-control" id="engOrgnzNm"
                                           name="engOrgnzNm" value="${organzLabList.engOrgnzNm }">
                                    <br>
                                    <label>지도교수명:</label>
                                    <input type="text" class="w3-input" id="mapProfNm" name="mapProfNm" value="${organzLabList.mapProfNm }">
                                    <br>
                                    <label> 연구실 소개:</label>
                                    <textarea class="w3-input" onkeydown="resize(this)"
                                              onkeyup="resize(this)" id="labIntro" name="labIntro">${organzLabList.labIntro}</textarea>
                                    <br>
                                    <label>연구원 수(박사/석박사/석사):</label>
                                    <input type="text" class="w3-input" id="rsrchrInfoText" name="rsrchrInfoText" value="${organzLabList.rsrchrInfoText}">
                                    <br>
                                    <label>상징색상명:</label>
                                    <input type="text" class="w3-input" id="symbolColorNm" name="symbolColorNm" value="${organzLabList.symbolColorNm}"> <br>
                                    <label>홈페이지 주소 :</label>
                                    <input class="w3-input" type="text" class="form-control" id="hmpageUrl"
                                           name="hmpageUrl" value="${organzLabList.hmpageUrl}">
                                    <br>
                                    <label>전화번호 :</label>
                                    <input class="w3-input" type="text" class="form-control" id="telNo" name="telNo" value="${organzLabList.telNo}">
                                    <br>
                                    <label>팩스번호 :</label>
                                    <input class="w3-input" type="text" class="form-control" id="faxNo" name="faxNo" value="${organzLabList.faxNo}">
                                    <br>
                                    <label> 주소 :</label>
                                    <input class="w3-input" type="text" class="form-control" id="addr" name="addr" value="${organzLabList.addr}">
                                    <br>
                                    <label>상세주소 :</label>
                                    <input type="text" class="w3-input" id="detailAddr" name="detailAddr" value="${organzLabList.detailAddr}">
                                    <br>
                                </div>

                                <div class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
                                    <label>국내외 구분: ${organzLabList.hmnbrdDstnct}</label>
			                                    
									<c:if test="${organzLabList.hmnbrdDstnct == '국내' }">
										<select class="w3-input  w3-white" id="hmnbrdDstnct" name="hmnbrdDstnct" style="height: 2.7em;">
											<option value="국내" selected="selected">국내1</option>
											<option value="국외">국외</option>
										</select>
									</c:if>
									<c:if test="${organzLabList.hmnbrdDstnct == '국외' }">
										<select class="w3-input  w3-white" id="hmnbrdDstnct" name="hmnbrdDstnct" style="height: 2.7em;">
											<option value="국내">국내</option>
											<option value="국외" selected="selected">국외1</option>
										</select>
									</c:if>
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
                                                  value="${organzLabList.prntsOrgnzNo }" readonly>
                                        </div>
                                        <Br>
                                        <div class="form-group">
                                            <label>부모기관명</label>
                                            <input class="w3-input" id="organzinput" name="orgnzFullNm" type="text"
                                                 value="${organzLabList.orgnzFullNm }"  readonly>
                                            <br>
                                            <button type="button" class="w3-button w3-blue" onclick="openOrganzSearch('학과')">기관검색하기
                                            </button>
                                        </div>
                                    </div>
                                    <br>

                                    <!-- 맞춤정보 입력란 -->
                                    <div class="ui-widget">
                                        <label for="tags">연구분야: </label> <input class="w3-input" id="tags">
                                        <div id="duplicateMsg" style="display: none">중복입니다 !!</div>
                                        <div id="cdNmList"></div>
                                    </div>

                                    <br>
                                    
                                    <button type="submit"
                                            class="w3-button w3-block w3-border w3-round-large w3-margin-bottom w3-large"
                                            style="letter-spacing: 2px;">수정
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



	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/organzjs/file.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>




</body>

</html>