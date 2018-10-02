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
    $('#calendar').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title'
      },
      defaultDate: '2018-10-20',
      editable: false,
      eventLimit: true, // allow "more" link when too many events
      eventSources: [
    	    {
    	      url: './List_JSON.jsp',
    	      color: 'skyblue',   // a non-ajax option
    	      textColor: 'white'
    	    }
    	  ],
      timeFormat: 'H(:mm)'
    });
    
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