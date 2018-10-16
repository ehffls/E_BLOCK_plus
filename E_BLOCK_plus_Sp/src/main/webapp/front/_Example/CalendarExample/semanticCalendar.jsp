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
//default휴가신청 calendar처리부분
	$('#r_start').calendar({
	  type: 'date',
	  endCalendar: $('#r_end')
	});
	$('#r_end').calendar({
	  type: 'date',
	  startCalendar: $('#r_start')
	});
});
</script>
</head>
<body>

<div class="ui container" style="margin-top:20px">
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
</div>

</body>
</html>