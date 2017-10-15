/*
 * 허주한
 */

$(function(){
	for(var i=1;i<=$("#charList button").length;i++){
		$("#charBtn"+i).click(clickCharBtn)
		console.log("@@@@");
	}
})
var matchChar ={
	1:['가','깋'],	2:['나','닣'],	3:['다','딯'],	4:['라','맇'],	5:['마','밓'],	6:['바','빟'],	7:['사','싷'],	8:['아','잏'],	9:['자','짛'],	10:['차','칳'],
	11:['카','킿'],	12:['타','팋'],	13:['파','핗'],	14:['하','힣'],	15:['A','z'],	16:['A', '힣']
}
var clickCharBtn = function(){
	
	
	var char = $(this).val();
	var type = $("#type").val();
	var start = matchChar[char][0];
	var end = matchChar[char][1];
	

	$.ajax({
		url : "/admin/organz/api/getnotilist?type="+type+"&start="+start+"&end="+end,
		type : "get",
		dataType : "json",
		data : "",
		success : function(response) {
		
			
			$("#fetchList").empty();
			
			if(response.data.length==0){
				$('#fetchList').append("<li class=''>" +
						"<span class='w3-medium'>No Result</span></li>");
				return;
				
			}
			
			for(var i = 0 ; i<response.data.length ; i++){
				
				$("#fetchList").append("<li class=''> " + 
				" <a href='/admin/noti/update?no=" + response.data[i].slctnNotiNo +"&type="+response.data[i].slctnNotiDstnct+"'>" +
    			" <span class='w3-medium'><b>"+response.data[i].orgnzFullNm+"</b>"+response.data[i].slctnTitle+"</span> </a>" +
    			" </li>");
			}
			
		},
		error : function(jqXHR, status, e) {
			console.error(status + " : " + e);
		}
	});
}