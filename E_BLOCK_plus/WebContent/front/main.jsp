<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<link href='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/fullcalendar.css' rel='stylesheet' />
<script src='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/fullcalendar.js'></script>
<script type="text/javascript">
$(function() {

	  $('#calendar').fullCalendar({
	    defaultView: 'listWeek',

	    header: {
	      center: 'addEventButton'
	    },

	    customButtons: {
	      addEventButton: {
	        text: 'add event...',
	        click: function() {
	          var dateStr = prompt('Enter a date in YYYY-MM-DD format');
	          var date = moment(dateStr);

	          if (date.isValid()) {
	            $('#calendar').fullCalendar('renderEvent', {
	              title: 'dynamic event',
	              start: date,
	              allDay: false
	            });
	            alert('Great. Now, update your database...');
	          } else {
	            alert('Invalid date.');
	          }
	        }
	      }
	    }
	  });
		
		//sidemenu처리 부분
		$('#mainpage').attr("class","active item");
		$('#sm_main').attr("class","active item");
	});
</script>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->

<div class="ui container" style="margin-bottom:20px">
	<h2 style="margin-top:20px">내 일정</h2>
		<div id="calendar" class="fc fc-unthemed fc-ltr">
		</div>
	</div>


<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>