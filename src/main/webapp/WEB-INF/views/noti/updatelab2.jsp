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
<script type="text/javascript">
	$(
			function() {
				$(document).on('click', '.fileDeleteBtn', function(event) {
					console.log("삭제")
					var fNo = $(this).attr('id')

					$.ajax({
						url : "/admin/organz/api/deletefile",
						data : "no=" + fNo,

						success : function(response) {
							$('#d' + fNo).remove()

						},
						error : function(jqXHR, status, e) {
							console.log(status + " : " + e);
						}
					});
				})

				var codeList = JSON.parse('${codeList}');
				var type = $("#type").val();
				if (codeList.length != 0) {
					for (var i = 0; i < codeList.length; i++) {
						$("#cdNmList")
								.append(
										"<div id='"
						+ codeList[i].cdId
						+ "'><span id='cdNm' name='cdNm' val='"
						+ codeList[i].cdNm
						+ "'>"
												+ codeList[i].cdNm
												+ "</span>"
												+ "<button id='deleteBtn' type='button' onclick='clickDelete(\""
												+ codeList[i].cdId
												+ "\");' class='btn'>X</button>"
												+ "<input type='hidden' name='codes["
						+ index + "].cdId' value='"
						+ codeList[i].cdId + "'>"
												+ "<input type='hidden' name='codes["
						+ index + "].cdNm' value='"
						+ codeList[i].cdNm + "'>"
												+ "</div>")
						checkList.push(codeList[i].cdNm);
						index++;
					}
				}

			})
</script>
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
							class="w3-margin-left w3-text-red" style="letter-spacing: 0.1em;">연구실
							모집공고</a>
					</h5>
				</div>

				<div
					class="w3-large w3-card-2 w3-white w3-padding-16 w3-margin-bottom">
					<div class="container">
						<div class="w3-row">
							<h4 class="w3-margin-left" style="letter-spacing: 0.3em;">연구실
								모집공고 수정</h4>
						</div>

						<div id="notilab" class="w3-row">
							<form class="login-form" id="login-form" name="loginform"
								method="post" enctype="multipart/form-data"
								action="${pageContext.servletContext.contextPath }/noti/update">
								<input type="hidden" name="type" value="연구실" id="type">
								<input type="hidden" name="tabnm" value="${vo.slctnNotiDstnct }">
								<input type="hidden" name="slctnNotiNo"
									value="${vo.slctnNotiNo }"> <input type="hidden"
									name="adminNo" value="${authUser.mbNo }">

								<div
									class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
									<div class="w3-row">
										<div class="w3-col" style="width: 150px">
											<label>기관번호:</label> <input class="w3-input" id="orgnzlabNo"
												name="orgnzNo" type="text" value="${vo.orgnzNo }" readonly>
										</div>
										<div class="w3-rest">
											<label>기관명:</label> <input class="w3-input"
												id="organzinputlab" type="text" value="${vo.orgnzFullNm }"
												readonly>
										</div>
										<br>
										<button class="w3-button w3-blue w3-block w3-round"
											type='button' onclick="openOrganzSearch('연구실')">기관검색하기
										</button>
									</div>

									<br>

									<div class="w3-half w3-margin-bottom">
										<label>모집년도:</label> <input class="w3-input" type="text"
											name="slctnYycl">
									</div>

									<div class="w3-half w3-margin-bottom">
										<label>모집학기:</label> <select
											class="w3-input  w3-white w3-block" name="slctnSemstr"
											style="height: 2.8em;">
											<option value="전기">전기</option>
											<option value="후기">후기</option>
											<option value="상시">상시</option>
										</select>
									</div>

									<Br> <label>제목:</label> <input class="w3-input"
										id="slctnTitle" name="slctnTitle" type="text"
										value="${vo.slctnTitle }"> <br>

									<div class="w3-row w3-row-padding w3-margin-bottom">
										<div class="w3-half">
											<label>모집기간(시작): </label> <input class="w3-input"
												id="slctnBeginDt" name="slctnBeginDt" type="text"
												value="${vo.slctnBeginDt }">
										</div>
										<div class="w3-half">
											<label>모집기간(종료): </label> <input class="w3-input"
												id="slctnEndDt" name="slctnEndDt" type="text"
												value="${vo.slctnEndDt }">
										</div>
									</div>
									<label for="tags">▣ 전공분야</label> <br> <input
										class="w3-input" id="tags">
									<div id="duplicateMsg" style="display: none">중복입니다 !!</div>
									<div id="cdNmList"></div>
									<br> <label for="">연구실 소개:</label>
									<textarea class="w3-input" rows="4" name="slctnText">${vo.slctnText }</textarea>

									<br>



								</div>
								<div
									class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">

									<div class="w3-row-padding">
										<label for="">주요 연구 분야:</label>
										<textarea class="w3-input" rows="4" name="prmryResrchField">${vo.prmryResrchField }</textarea>

										<br> <label for="">모집대상:</label> <input class="w3-input"
											id="slctnNops" name="slctnNops" ${vo.slctnNops }> <br>

										<label>지원자격: </label>

										<textarea class="w3-input" rows="2" id="suprtQualf"
											name="suprtQualf">${vo.suprtQualf }</textarea>

										<br> <label>전형방법:</label>

										<textarea class="w3-input" rows="4" id="slsnMth"
											name="slsnMth">${vo.slsnMth }</textarea>
										<br> <label for="">▣ 제출서류</label>

										<textarea class="w3-input" rows="4" id="sbmtDocText"
											name="sbmtDocText">${vo.sbmtDocText }</textarea>

										<br>




									</div>
								</div>
								<div class="w3-row">
									<h4 class="w3-margin-left" style="letter-spacing: 0.3em;">기타
										정보 추가</h4>


									<div
										class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">
										<label>광고구분:</label> <select
											class="w3-input  w3-white w3-block" name="pchrgYn"
											style="height: 3em;">
											<option value="Y">유료</option>
											<option value="N">무료</option>
										</select> <Br>



										<p class="lead">지원 정보</p>
										<div class="checkbox w3-margin-bottom">
											<c:choose>
												<c:when test="${vo.bk21EorgnzSuprtYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-1"> <input name="bk21EorgnzSuprtYn"
														type="checkbox" value="Y" id="checkbox-1 " checked=checked>bk21
														지원
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-1"> <input name="bk21EorgnzSuprtYn"
														type="checkbox" value="Y" id="checkbox-1">bk21 지원
													</label>

												</c:otherwise>
											</c:choose>

										</div>
										<div class="checkbox w3-margin-bottom">

											<c:choose>
												<c:when test="${vo.tuitionSuprtYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-2"> <input name="tuitionSuprtYn"
														type="checkbox" value="Y" id="checkbox-2 " checked=checked>등록금
														지원여부
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-2"> <input name="tuitionSuprtYn"
														type="checkbox" value="Y" id="checkbox-2">등록금 지원여부
													</label>

												</c:otherwise>
											</c:choose>


										</div>


										<div class="checkbox w3-margin-bottom">

											<c:choose>
												<c:when test="${vo.lvncSuprtYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-3"> <input name="lvncSuprtYn"
														type="checkbox" value="Y" id="checkbox-3" checked=checked>생활비
														지원 여부
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-3"> <input name="lvncSuprtYn"
														type="checkbox" value="Y" id="checkbox-3">생활비 지원
														여부
													</label>

												</c:otherwise>
											</c:choose>
										</div>
										<div class="checkbox w3-margin-bottom">

											<c:choose>
												<c:when test="${vo.incetSuprtYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-4"> <input name="incetSuprtYn"
														type="checkbox" value="Y" id="checkbox-4 " checked=checked>인센티브
														지원여부
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-4"> <input name="incetSuprtYn"
														type="checkbox" value="Y" id="checkbox-4">인센티브
														지원여부
													</label>

												</c:otherwise>
											</c:choose>

										</div>
										<div class="checkbox w3-margin-bottom">
											<c:choose>
												<c:when test="${vo.dormSuprtYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-5"> <input name="dormSuprtYn"
														type="checkbox" value="Y" id="checkbox-5 " checked=checked>기숙사
														지원 여부
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-5"> <input name="dormSuprtYn"
														type="checkbox" value="Y" id="checkbox-5">기숙사 지원
														여부
													</label>

												</c:otherwise>
											</c:choose>

										</div>
										<div class="checkbox w3-margin-bottom">
											<c:choose>
												<c:when test="${vo.internYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-6"> <input name="internYn"
														type="checkbox" value="Y" id="checkbox-6 " checked=checked>인턴
														여부
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-6"> <input name="internYn"
														type="checkbox" value="Y" id="checkbox-6">인턴 여부
													</label>

												</c:otherwise>
											</c:choose>

										</div>
										<div class="checkbox w3-margin-bottom">
											<c:choose>
												<c:when test="${vo.lrstyJoingYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-7"> <input name="lrstyJoingYn"
														type="checkbox" value="Y" id="checkbox-7 " checked=checked>학회
														참가 여부
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-7"> <input name="lrstyJoingYn"
														type="checkbox" value="Y" id="checkbox-7">학회 참가 여부
													</label>

												</c:otherwise>
											</c:choose>


										</div>
										<div class="checkbox w3-margin-bottom">

											<c:choose>
												<c:when test="${vo.lrstyJoingfeeSuprtYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-8"> <input
														name="lrstyJoingfeeSuprtYn" type="checkbox" value="Y"
														id="checkbox-8" checked=checked>학회 참가비 지원 여부
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-8"> <input
														name="lrstyJoingfeeSuprtYn" type="checkbox" value="Y"
														id="checkbox-8">학회 참가비 지원 여부
													</label>

												</c:otherwise>
											</c:choose>

										</div>
										<div class="checkbox w3-margin-bottom">
											<c:choose>
												<c:when test="${vo.resrchTaskJoingYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-9"> <input name="resrchTaskJoingYn"
														type="checkbox" value="Y" id="checkbox-9" checked=checked>연구
														과제 참가 여부
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-9"> <input name="resrchTaskJoingYn"
														type="checkbox" value="Y" id="checkbox-9">연구 과제 참가
														여부
													</label>

												</c:otherwise>
											</c:choose>

										</div>
										<div class="checkbox w3-margin-bottom">

											<c:choose>
												<c:when test="${vo.stdtrOpptySuprtYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-10"> <input name="stdtrOpptySuprtYn"
														type="checkbox" value="Y" id="checkbox-10" checked=checked>연수기회
														지원 여부
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-10"> <input name="stdtrOpptySuprtYn"
														type="checkbox" value="Y" id="checkbox-10">연수기회 지원
														여부
													</label>

												</c:otherwise>
											</c:choose>

										</div>
										<div class="checkbox w3-margin-bottom">

											<c:choose>
												<c:when test="${vo.eduPgmJoingSuprtYn=='Y' }">

													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-11"> <input
														name="eduPgmJoingSuprtYn" type="checkbox" value="Y"
														id="checkbox-11" checked=checked>연수기회 지원 여부
													</label>

												</c:when>
												<c:otherwise>
													<label
														class="w3-button w3-block w3-border w3-border-blue w3-round"
														for="checkbox-11"> <input
														name="eduPgmJoingSuprtYn" type="checkbox" value="Y"
														id="checkbox-11">연수기회 지원 여부
													</label>

												</c:otherwise>
											</c:choose>

										</div>
										<label>기타 지원 내역: </label> <input class="w3-input"
											id="suprtFvrText" name="suprtFvrText" type="text"
											value="${vo.suprtFvrText }"> <br>

									</div>
									<div
										class="w3-col s12 m5 l5 w3-row w3-padding-16 w3-row-padding w3-medium">

										<span class=""> 담당자 정보 등록 </span> <label>담당자: </label> <input
											class="w3-input" id="chrgrNm" name="chrgrNm" type="text"
											value="${vo.chrgrNm }"> <br> <label>전화번호:
										</label> <input class="w3-input" id="chrgrTelNo" name="chrgrTelNo"
											type="text" value="${vo.chrgrTelNo }"> <br> <label>fax:
										</label> <input class="w3-input" id="" name="" type="text"> <br>

										<label>email: </label> <input class="w3-input" id="chrgrEmail"
											name="chrgrEmail" type="text" value="${vo.chrgrEmail }">

										<br> <label>로고등록: </label>

										<table id="filetable" cellpadding="5" cellspacing="0">
											<tr name="tr_attach_file">
												<td><input id="file" type="file" name="attachFile"
													multiple /></td>
											</tr>


										</table>

										<div id='apndngfiles'>
											<c:forEach items="${fileList }" var="fileList">
												<div id="d${fileList.apndngFileNo }">
													<span>${fileList.apndngFileNm }</span>
													<button id="${fileList.apndngFileNo }" type="button"
														class="btn fileDeleteBtn">X</button>
												</div>
											</c:forEach>

										</div>

										<br> <label>기타</label>
										<div class="checkbox">
											<c:choose>
												<c:when test="${vo.onlineSuprtYn=='Y' }">
													<label class="btn-lg btn-default btn-block"> <input
														type="checkbox" name="onlineSuprtYn" checked="checked"
														value="Y">온라인 지원 신청
													</label>
												</c:when>
												<c:otherwise>
													<label class="btn-lg btn-default btn-block"> <input
														type="checkbox" name="onlineSuprtYn" value="Y">온라인
														지원 신청
													</label>
												</c:otherwise>
											</c:choose>

										</div>

										<br>

										<button type="submit"
											class="w3-button w3-block w3-border w3-round-large w3-margin-bottom w3-large"
											style="letter-spacing: 2px;">모집공고 수정</button>
									</div>
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
		src="${pageContext.request.contextPath}/resources/js/search.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/resources/js/notijs/insertnoti.js"></script>

</body>

</html>