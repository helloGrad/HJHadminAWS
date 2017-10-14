<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="charList" class="w3-container w3-row w3-center w3-padding-16">
	<input id="type" type="hidden" value="${list[0].orgnzDstnct }" />
	<button id="charBtn16" class=" w3-button w3-round-large w3-border w3-border-blue" value='16'>
		<span class="w3-large">All</span>
	</button>
	<button id="charBtn1" class="w3-button w3-round-large  w3-border w3-border-blue" value='1'>
		<span class="w3-large">ㄱ</span>
	</button>
	<button id="charBtn2" class=" w3-button w3-round-large  w3-border w3-border-blue" value='2'>
		<span class="w3-large">ㄴ</span>
	</button>
	<button id="charBtn3" class=" w3-button w3-round-large  w3-border w3-border-blue" value='3'>
		<span class="w3-large">ㄷ</span>
	</button>
	<button id="charBtn4" class=" w3-button w3-round-large  w3-border w3-border-blue" value='4'>
		<span class="w3-large">ㄹ</span>
	</button>
	<button id="charBtn5" class=" w3-button w3-round-large  w3-border w3-border-blue" value='5'>
		<span class="w3-large">ㅁ</span>
	</button>
	<button id="charBtn6" class=" w3-button w3-round-large  w3-border w3-border-blue" value='6'>
		<span class="w3-large">ㅂ</span>
	</button>
	<button id="charBtn7" class=" w3-button w3-round-large  w3-border w3-border-blue" value='7'>
		<span class="w3-large">ㅅ</span>
	</button>
	<button id="charBtn8" class=" w3-button w3-round-large  w3-border w3-border-blue" value='8'>
		<span class="w3-large">ㅇ</span>
	</button>
	<button id="charBtn9" class=" w3-button w3-round-large  w3-border w3-border-blue" value='9'>
		<span class="w3-large">ㅈ</span>
	</button>
	<button id="charBtn10" class=" w3-button w3-round-large  w3-border w3-border-blue" value='10'>
		<span class="w3-large">ㅊ</span>
	</button>
	<button id="charBtn11" class=" w3-button w3-round-large  w3-border w3-border-blue" value='11'>
		<span class="w3-large">ㅋ</span>
	</button>
	<button id="charBtn12" class=" w3-button w3-round-large  w3-border w3-border-blue" value='12'>
		<span class="w3-large">ㅌ</span>
	</button>
	<button id="charBtn13" class=" w3-button w3-round-large  w3-border w3-border-blue" value='13'>
		<span class="w3-large">ㅍ</span>
	</button>
	<button id="charBtn14" class=" w3-button w3-round-large  w3-border w3-border-blue" value='14'>
		<span class="w3-large">ㅎ</span>
	</button>
	<button id="charBtn15" class=" w3-button w3-round-large  w3-border w3-border-blue" value='15'>
		<span class="w3-large">etc</span>
	</button>
</div>