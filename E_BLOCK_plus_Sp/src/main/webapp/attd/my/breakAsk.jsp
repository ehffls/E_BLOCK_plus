<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="ui container" style="margin-top:20px">
  <form class="ui form" id="attd_ask">
	<h4 class="ui dividing header">휴가신청 결재서</h4>
	<div class="two fields">
	  <div class="field">
		<label>시작일자</label>
		  <div class="ui calendar" id="r_start">
			<div class="ui input left icon">
			  <i class="calendar icon"></i>
			  <input id="at_sdate" name="at_sdate" type="text" placeholder="시작일자">
			</div>
		  </div>
	  </div>
	  <div class="field">
		<label>종료일자</label>
		  <div class="ui calendar" id="r_end">
			<div class="ui input left icon">
			  <i class="calendar icon"></i>
			  <input id="at_fdate" name="at_fdate" type="text" placeholder="종료일자">
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
	  <input type="hidden" name="at_days" id="at_days">
	  <input type="hidden" name="at_sort" value="atd-d">
  </form>
</div>

<script type="text/javascript">
$('#r_start').calendar({
  type: 'date',
  endCalendar: $('#r_end')
});
$('#r_end').calendar({
  type: 'date',
  startCalendar: $('#r_start')
});
</script>