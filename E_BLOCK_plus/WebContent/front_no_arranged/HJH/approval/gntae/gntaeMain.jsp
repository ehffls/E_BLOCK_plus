<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재신청페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script type="text/javascript">
$(function(){
	var witch = "";
	$('#ap_sel').dropdown({
		allowCategorySelection: true,
		action: function(text, value) {
			if(text=="휴가신청"){
				witch="breakFormAjax";
			}else if(text=="반가신청"){
				witch="harfBreakFormAjax"
			}
				$.ajax({
					method:"get"
				   ,url:witch+".jsp"
				   ,success:function(result){
					   $("#form_1").html(result);
				   }
				   ,error:function(xhrObject){
					   alert(xhrObject.responseText);
				   }
					
				});
		}
	});
	$('#ap_sel').$('#gntae_1').$('#gntae_2').find('div').click({
		/* var a = $('#ap_sel').$('#gntae_1').$('#gntae_2').find('div'); */
		$(this).attr('class', 'item active');
	});
	$('#gt_1').click(function() {
		$('#gt_1').attr("class","active item");
	});
	$('#gt_2').click(function() {
		$("#ap_sel").find("item").attr("class","item");
		$('#gt_2').attr("class","active item");
	});
	$('#gt_3').click(function() {
		location.href=".jsp";
	});
	$('#gt_4').click(function() {
		location.href=".jsp";
	});
	$('#bp_1').click(function() {
		location.href=".jsp";
	});
	$('#bp_2').click(function() {
		location.href=".jsp";
	});
	$('#bp_3').click(function() {
		location.href=".jsp";
	});
	$('#ts_1').click(function() {
		location.href=".jsp";
	});
	$('#ap_Ok').click(function() {
		location.href=".jsp";
	});
	$('#ap_cancel').click(function() {
		location.href=".jsp";
	});
	$('#approval').attr("class","active item");
	$('#sm_ap').attr("class","active item");
	$('#sm_ap_form').attr("class","active item");
});
</script>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->

<div class="ui container">
<div class="ui compact menu">
	<div class="ui dropdown button" id="ap_sel" style="margin-right: 0px;">
	  <span class="text">결재종류</span>
	  <i class="dropdown icon"></i>
		<div class="menu" id="gntae_1">
		  <div class="active item">
		  <i class="dropdown icon"></i>
			<span class="text">근태관련</span>
			  <div class="menu" id="gntae_2">
				<div class="active item" id="gt_1">휴가신청</div>
				<div class="item" id="gt_2">반가신청</div>
				<div class="item" id="gt_3">출장신청</div>
				<div class="item" id="gt_4">외출신청</div>
			  </div>
		  </div>
		  <div class="item">
		  <i class="dropdown icon"></i>
			<span class="text">비품관련</span>
			  <div class="menu">
				<div class="item" id="bp_1">등록신청</div>
				<div class="item" id="bp_2">구매신청</div>
				<div class="item" id="bp_3">사용신청</div>
			  </div>
		  </div>
		  <div class="item">
		  <span class="text" id="ts_1">퇴사신청</span>
		  </div>
		</div>
	  </div>
  </div>
</div>
<div id="form_1"></div>

<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>