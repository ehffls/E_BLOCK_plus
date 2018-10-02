<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int tablim = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내결재신청목록</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	$('#sm_ap').attr("class","active item");
	$('#sm_ap_fromme').attr("class","active item");
});
</script>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->
<div class="ui container" style="margin-top:20px">
<table id="taable" class="ui celled table">
      <thead>
        <tr><th>Band</th>
        <th>Song</th>
      </tr></thead>
    </table>
</div>

<script>
 var table =  $('#taable').DataTable( {
     ajax: {
		url: "./List_JSON.jsp",
    	 dataSrc: 'data'
     },
     columns: [
         { "data": "band" },
         { "data": "song" }
     ]
 } );

$('#taable tbody').on( 'dblclick', 'tr', function () {
	 var data = table.row( this ).data();
     alert(data["band"] );
     
    if ( $(this).hasClass('active') ) {
        $(this).removeClass('active');
    }
    else {
        table.$('tr.active').removeClass('active');
        $(this).addClass('active');
    }
} );
$('#taable tbody').on( 'mouseover', 'tr', function () {
	 var data = table.row( this ).data();
       table.$('tr.active').removeClass('active');
       $(this).addClass('active');
} );

</script>
<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>