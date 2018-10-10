<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사평가 조회</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>



	<!--=============== 작성부분 ===============-->
	<div class="ui container">
		<br>
		<button class="ui button" id="i_btn">입력</button>
		<button class="ui button" id="u_btn">수정</button>
		<br>
		<table id="taable" class="ui celled table">
			<thead>
				<tr>
					<th>평가한사원번호</th>
					<th>대상사원번호</th>
					<th>분기번호</th>
					<th>평가일자</th>
					<th>평가내용</th>
					<th>평가점수</th>
					<th>비율</th>
					<th>사원이름</th>
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
		url: "/E_BLOCK_plus/emp/pev/myList.ebp",
    	 dataSrc: 'data'
     },
     columns: [
 		{ "data" :"tg_eno"},
        { "data" :"ev_eno"}, 
        { "data" :"ev_date"}, 
        { "data" :"qrt_no"}, 
        { "data" :"ev_content"}, 
        { "data" :"ev_score"}, 
        { "data" :"ratio" }
     ]
 } );

$('#taable tbody').on( 'click', 'tr', function () {
	 var data = table.row( this ).data();
     /* alert(data["band"] ); */
     
    if ( $(this).hasClass('active') ) {
        $(this).removeClass('active');
    }
    else {
        table.$('tr.active').removeClass('active');
        $(this).addClass('active');
    }
} );

</script>
	<!--=============== 작성부분 ===============-->
	<script type="text/javascript">

	$("#i_btn").on("click",function(){
		 location.href="pevAdd.jsp";
	});
	
	$("#u_btn").on("click",function(){
		location.href="pevUpd.jsp";
	});
	
	</script>



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>