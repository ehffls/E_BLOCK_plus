<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 출퇴근 내역</title>
<style type="text/css">
 .fc-sun{
  color: red;
 }
 .fc-sat{
  color: blue;
 }
 /* table .fc-view{
 	border: solid;
 	
 } */	
</style>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>

<link href='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/fullcalendar.css' rel='stylesheet' />
<script src='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/fullcalendar.js'></script>
<script src='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/locale-all.js'></script>
<script src='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/gcal.js'></script>

<script>


	$(document).ready(function() {

		$('#calendar').fullCalendar({
			header : {
				left : 'prev,next today',
				center : 'title'
			},
			//defaultDate: '2018-10-20',
			editable : false,
			eventLimit : true, // allow "more" link when too many events
			googleCalendarApiKey : "AIzaSyB3TgMopBcluINZyCntrHTmYpojvV81xcE", // Google API KEY // 예제소스에 적힌 구글캘린더 API 키는 FullCalendar 예제에 있는 API키를 그대로 사용한 것이다.
			eventSources : [
				// 대한민국의 공휴일
				{
					googleCalendarId : "ko.south_korea#holiday@group.v.calendar.google.com",
					className : "koHolidays",
					color : "#FF0000",
					textColor : "#FFFFFF"
				},
				{
					url : '/E_BLOCK_plus/emp/cmt/cmt_calendar',
					color : 'skyblue', // a non-ajax option
					textColor : 'white',
				/*   data: {
					  e_no :$("#e_no").val()
				  } */
				}
			],
			 locale:"ko",
			timeFormat : 'H(:mm)'
		});

		$('#sm_mp').attr("class", "active item");
		$('#sm_mp_com').attr("class", "active item");
	});
</script>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>




	<!--=============== 작성부분 ===============-->
	<div class="ui container">
		<!-- <button class="ui button" onclick="">
  	내정보
	</button> -->
		<div class="ui segment" style="margin-top: 5px">
			<div class="ui container" style="margin-top: px;">
				<div class="ui column stackable grid container">
					<div class="column" align="center" style="padding-left: 0px;">
						<h2 class="ui header" style="padding-top: 5px; padding-bottom: 5px">
							<i class="large icons"> <i class="user icon"></i> <i class="bottom rigth corner calendar alternate outline icon"></i>
							</i> 내 출퇴근 내역
						</h2>
					</div>
				</div>

			</div>
			<div id="calendar" class="fc fc-unthemed fc-ltr"></div>
		</div>
	</div>
	<!--=============== 작성부분 ===============-->




	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>