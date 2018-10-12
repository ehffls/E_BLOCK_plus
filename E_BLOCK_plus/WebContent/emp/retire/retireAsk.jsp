<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String Project_Root3 = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재신청페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
</head>
<body>
	<script>
$(document).ready(function(){
	var witch = "";
	//Form dropdown처리부분
	$("#dor").dropdown({
		onChange: function(value, text, $selectedItem) {
			if(text=="휴가신청"){
				witch="./breakAsk.jsp";
			}else if(text=="반가신청"){
				witch="./harfBreakAsk.jsp";
			}else if(text=="출장신청"){
				witch="./businessTripAsk.jsp";
			}
			$('#form_1').transition('fade down');
				$.ajax({
					method:"get"
				   ,url:witch
				   ,success:function(result){
					   $("#form_1").html(result);
				   }
				});
			$('#form_1').transition('fade up');
		}
	});
	
	
	$('#day').calendar({
		  type: 'date'
		});

	
	$('#ap_Ok').click(function() {
		$("#retire_ask").attr("method","post");
		$("#retire_ask").attr("action","./ask.ebp");
		$("#retire_ask").submit();
	});
	$('#ap_cancel').click(function() {
		
	});
	
	//sidemenu처리 부분
	/* $('#approval').attr("class","active item");
	$('#sm_ap').attr("class","active item");
	$('#sm_ap_form').attr("class","active item"); */
});
</script>


	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>




	<!--=============== 작성부분 ===============-->


	<div class="ui container" style="margin-top: 20px">
		<form id="retire_ask" class="ui form">
			<h4 class="ui dividing right header">사직서</h4>
			<div class="two fields">
				<div class="field">
					<label>퇴사예정일자</label>
					<div class="ui calendar" id="day">
						<div class="ui input left icon">
							<i class="calendar icon"></i> <input name="rt_date" type="text" placeholder="Date">
						</div>
					</div>
				</div>
				<div class="field"></div>
			</div>
			<div class="field" style="height: 300px">
				<label>신청사유</label>
				<textarea name="ask_rsn" style="resize: none; height: 80%"></textarea>
			</div>
			<div class="field">
				<div class="ui button" tabindex="0" id="ap_Ok">저장</div>
				<div class="ui button" tabindex="0" id="ap_cancel">취소</div>
			</div>
		</form>
	</div>
	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>