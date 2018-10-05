<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->
<div class="ui container">
<table id="taable" class="ui celled table">
      <thead>
        <tr>
        <th>비품신청 번호</th>
        <th>신청사원 번호</th>
        <th>결재사원 번호</th>
        <th>신청일자</th>
        <th>비품분류</th>
        <th>비품이름</th>
      	</tr>
      </thead>
    </table>
</div>

<script>
/* $('#taable').DataTable( {
	  ajax: {
	  	url:"./jsonTest.json",
		type:"POST",
		dataType:"JSON",
		dataSrc: ""
	  },
      columns: [
          { data: "band" },
          { data: "song" }
      ]
} );
 */
 var table =  $('#taable').DataTable( {
     ajax: {
		url: "./addAskList_JSON.jsp",
    	 dataSrc: 'data'
     },
     columns: [
         {"data": "eq_addno"},
         {"data": "ask_eno"},
         {"data": "sign_eno"},
         {"data": "ask_date"},
         {"data": "eq_sort"},
         {"data": "eq_name"},
         {"data": "outcome"},
         {"data": "sign_date"},
         {"data": "sign_rsn"}
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