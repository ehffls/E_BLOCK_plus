<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 출퇴근 내역</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<link href='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/fullcalendar.css' rel='stylesheet' />
<script src='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/lib/moment.min.js'></script>
<script src='<%=Project_Root%>/0_src/js/fullcalendar-3.9.0/fullcalendar.js'></script>
<script>

  $(document).ready(function() {
	  var aaa=[
	        {
	            "title": '출근시간 : 8:00 AM',
	            "start": '2018-10-01'
	          },
	          {
	              "title": '퇴근시간 : 8:00 PM',
	              "start": '2018-10-01'
	          }/* ,
	          {
	              title: '출근시간 : 8:20 AM',
	              start: '2018-10-02'
	          },
	          {
	              title: '퇴근시간 : 7:31 PM',
	              start: '2018-10-02'
	          } */
	        ];
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title'
      },
      defaultDate: '2018-10-20',
      eventLimit: true, // allow "more" link when too many events
      events: aaa
    });


	//sidemenu처리 부분
	$('#sm_mp').attr("class","active item");
	$('#sm_mp_com').attr("class","active item");
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
	<h2 style="margin-top:20px">내 출퇴근 내역</h2>
		<div id="calendar" class="fc fc-unthemed fc-ltr">
		</div>
	</div>
	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>