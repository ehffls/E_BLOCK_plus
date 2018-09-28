<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아작스반가</title>
<script type="text/javascript">
$('#day').calendar({
  type: 'date'
});
$('#time').dropdown();
</script>
</head>
<body>
<div class="ui container" style="margin-top:20px">
  <form class="ui form">
	<h4 class="ui dividing header">반가신청 결재서</h4>
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
	<label>신청일자</label>
	  <div class="ui calendar" id="day">
    	<div class="ui input left icon">
      	  <i class="calendar icon"></i>
      	  <input type="text" placeholder="Date">
    	</div>
  	  </div>
	</div>
	<div class="field">
	<label>신청시간</label>
	<div class="ui selection dropdown" id="time">
  <input type="hidden" name="t_sel">
  <i class="dropdown icon"></i>
  <div class="default text">신청시간</div>
  <div class="menu">
    <div class="item" data-value="1">오전</div>
    <div class="item" data-value="0">오후</div>
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
</body>
</html>