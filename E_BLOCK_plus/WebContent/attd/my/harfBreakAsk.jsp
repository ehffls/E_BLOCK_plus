<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="ui container" style="margin-top:20px">
  <form class="ui form" id="attd_ask">
	<h4 class="ui dividing header">반가신청 결재서</h4>
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
		<label>신청사유</label>
		<textarea name="at_rsn" style="resize:none; height:80%"></textarea>
	  </div>
	  <div align="center">
		<div class="ui button" tabindex="0" id="ap_Ok">신청</div>
		<div class="ui button" tabindex="0" id="ap_cancel">취소</div>
	  </div>
	  <input type="hidden" name="at_days" id="at_days" value="0.5">
	  <input type="hidden" name="at_sort" value="atd-d">
  </form>
</div>

<script type="text/javascript">
$('#day').calendar({
  type: 'date'
});
$('#time').dropdown();
</script>