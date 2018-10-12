<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String Project_Root3 = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재신청페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script type="text/javascript">
$(function(){
	//Form dropdown처리부분
	var witch = "";
	$('#ap_sel').dropdown({
		allowCategorySelection: true,
		action: function(text, value) {
			if(text=="휴가신청"){
				witch="<%=Project_Root3 %>/attd/my/breakAsk.jsp";
			}else if(text=="반가신청"){
				witch="<%=Project_Root3 %>/attd/my/harfBreakAsk.jsp";
			}else if(text=="출장신청"){
				witch="<%=Project_Root3 %>/attd/my/businessTripAsk.jsp";
			}else if(text=="외출신청"){
				witch="<%=Project_Root3 %>/attd/my/goOutAsk.jsp";
			}else if(text=="등록신청"){
				witch="<%=Project_Root3 %>/equip/add/newArticleAsk.jsp";
			}else if(text=="구매신청"){
				witch="<%=Project_Root3 %>/equip/purc/buyArticleAsk.jsp";
			}else if(text=="사용신청"){
				witch="<%=Project_Root3 %>/equip/inb/useArticleAsk.jsp";
			}else if(text=="퇴사신청"){
				witch="<%=Project_Root3 %>/emp/retire/retireAsk.jsp";
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
	$('#ap_Ok').click(function() {
		location.href=".jsp";
	});
	$('#ap_cancel').click(function() {
		location.href=".jsp";
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
	
	//sidemenu처리 부분
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

<div class="ui container" style="margin-top: 10px">
<h2 style="margin-top:20px">결재신청</h2>
<div class="ui compact menu">
	<div class="ui dropdown button" id="ap_sel" style="margin-right: 0px;">
	  <span class="text">결재종류</span>
	  <i class="dropdown icon"></i>
		<div class="menu" id="gntae_1">
		  <div class="item">
		  <i class="dropdown icon"></i>
			<span class="text">근태관련</span>
			  <div class="menu" id="gntae_2">
				<div class="item" id="gt_1">휴가신청</div>
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
		  <i class="dropdown icon"></i>
		  <span class="text" id="ts_1">사직관련</span>
		  	<div class="menu">
				<div class="item" id="bp_1">퇴사신청</div>
			  </div>
		  </div>
		</div>
	  </div>
  </div>
</div>
<div id="form_1">
<div class="ui container" style="margin-top:20px">
  <form class="ui form">
	<h4 class="ui dividing header">휴가신청 결재서</h4>
	<div class="two fields">
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">신청사원</a>
		  <input type="text">
		</div>
	  </div>
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">결재사원</a>
		  <input type="text">
		</div>
	  </div>
	</div>
	<div class="two fields">
	  <div class="field">
		<label>시작일자</label>
		  <div class="ui calendar" id="r_start">
			<div class="ui input left icon">
			  <i class="calendar icon"></i>
			  <input type="text" placeholder="시작일자">
			</div>
		  </div>
	  </div>
	  <div class="field">
		<label>종료일자</label>
		  <div class="ui calendar" id="r_end">
			<div class="ui input left icon">
			  <i class="calendar icon"></i>
			  <input type="text" placeholder="종료일자">
			</div>
		  </div>
	  </div>
	</div>
	  <div class="field" style="height:300px">
		<label>결재사유</label>
		<textarea style="resize:none; height:80%"></textarea>
	  </div>
	  <div class="field">
		<div class="ui button" tabindex="0" id="ap_Ok">저장</div>
		<div class="ui button" tabindex="0" id="ap_cancel">취소</div>
	  </div>
  </form>
</div>
</div>

<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>