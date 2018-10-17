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
<script>
function c_days(){
	var input1=$("#at_sdate").val();
	var input2=$("#at_fdate").val();
	
	

	var date1 = new Date(input1.substr(0,4),input1.substr(5,2)-1,input1.substr(8,2));
	var date2 = new Date(input2.substr(0,4),input2.substr(5,2)-1,input2.substr(8,2));

	var interval = date2 - date1;
	var day = 1000*60*60*24;
	
	var days = parseInt(interval/day)+1;
	
	if($("#at_days").val()==''){
		$("#at_days").val(days);
	}
	
	/* var week = date1.getDay() - date2.getDay(); 
	
	if(week<0){
		if(days>7){
			var check = days/7;
			days = days-2;
		}else{
			days = days-2;
		}
	} */
	
	$("#attd_ask").attr("method","post");
	$("#attd_ask").attr("action","./ask");
	$("#attd_ask").submit();
}
</script>
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
	//default휴가신청 calendar처리부분
	$('#r_start').calendar({
	  type: 'date',
	  endCalendar: $('#r_end')
	});
	$('#r_end').calendar({
	  type: 'date',
	  startCalendar: $('#r_start')
	});
	
	$('#ap_Ok').click(function() {
		c_days();
	});
	$('#ap_cancel').click(function() {
		location.href="/E_BLOCK_plus/emp/cmt/myList.jsp";
	});
	
	//sidemenu처리 부분
	$('#sm_fromMe').attr("class", "active item");
	$('#sm_fromMe_attdC').attr("class", "active item");
});
</script>


	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>




	<!--=============== 작성부분 ===============-->



	<div class="ui container" style="margin-top: 10px">
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="file alternate outline icon"></i>
					<div class="content">결제신청</div>
				</h2>
			</div>
		</div>
		<div class="ui segment">
			<div class="ui compact selection dropdown" id="dor">
				<i class="dropdown icon"></i>
				<div class="text">휴가신청</div>
				<div class="menu">
					<div class="item">휴가신청</div>
					<div class="item">반가신청</div>
					<div class="item">출장신청</div>
				</div>
			</div>
			<div id="form_1">
				<div class="ui container" style="margin-top: 20px">
					<form class="ui form" id="attd_ask">
						<h4 class="ui dividing header">휴가신청 결재서</h4>
						<div class="two fields">
							<div class="field">
								<label>시작일자</label>
								<div class="ui calendar" id="r_start">
									<div class="ui input left icon">
										<i class="calendar icon"></i> <input name="at_sdate" id="at_sdate" type="text" placeholder="시작일자">
									</div>
								</div>
							</div>
							<div class="field">
								<label>종료일자</label>
								<div class="ui calendar" id="r_end">
									<div class="ui input left icon">
										<i class="calendar icon"></i> <input name="at_fdate" id="at_fdate" type="text" placeholder="종료일자">
									</div>
								</div>
							</div>
						</div>
						<div class="field" style="height: 300px">
							<label>신청사유</label>
							<textarea name="at_rsn" style="resize: none; height: 80%"></textarea>
						</div>
						<div align="center">
							<div class="ui button" tabindex="0" id="ap_Ok">저장</div>
							<div class="ui button" tabindex="0" id="ap_cancel">취소</div>
						</div>
						<input type="hidden" name="at_days" id="at_days"> <input type="hidden" name="at_sort" value="atd-d">
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--=============== 작성부분 ===============-->


	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>