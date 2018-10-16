<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아작스외출</title>
<script type="text/javascript">
$('#timestart').calendar({
  type: 'time',
  endCalendar: $('#timeend')
});
$('#timeend').calendar({
  type: 'time',
  startCalendar: $('#timestart')
});
$('#day').calendar({
	  type: 'date'
});
</script>
</head>
<body>
<div class="ui container" style="margin-top:20px">
  <form class="ui form">
	<h4 class="ui dividing header">외출신청 결재서</h4>
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
	<div class="field">
	<label>신청일자</label>
	<div class="ui calendar" id="day">
    <div class="ui input left icon">
      <i class="calendar icon"></i>
      <input type="text" placeholder="Date">
    </div>
  </div>
	</div>
	<div class="two fields">
	  <div class="field">
		  <div class="ui calendar" id="timestart">
    <div class="ui input left icon">
      <i class="time icon"></i>
      <input type="text" placeholder="Time">
    </div>
  </div>
	  </div>
	  <div class="field">
		  <div class="ui calendar" id="timeend">
    <div class="ui input left icon">
      <i class="time icon"></i>
      <input type="text" placeholder="Time">
    </div>
  </div>
	  </div>
	</div>
	  <div class="field" style="height:300px">
		<label>결재사유</label>
		<textarea style="resize:none; height:80%"></textarea>
	  </div>
	  <div align="center">
		<div class="ui button" tabindex="0" id="ap_Ok">저장</div>
		<div class="ui button" tabindex="0" id="ap_cancel">취소</div>
	  </div>
  </form>
</div>
</body>
</html>