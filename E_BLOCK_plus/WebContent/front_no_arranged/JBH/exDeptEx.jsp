<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>




	<!--=============== 작성부분 ===============  -->
	<script type="text/javascript">
	$(document).ready(function() {
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

	$('#taable tbody').on( 'click', 'tr', function () {
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
	});
	function dept(){
		$('#dept_S').modal('show')
	}
	function back(){
		
		location.href="./exDeptList.jsp"
	}
</script>
<!--=================================================================================  -->
<div class="ui mini modal" id="dept_S" >
  <div class="header">부서 예산 할당</div>
  
    <div class="content">
    <div class="bady">
    <div class="text">현재금액</div>
    <div class="ui input" style="width:100%"><input type="text" ></div>
    <div class="text">변경 금액</div>
    <div class="ui input" style="width:100%"><input type="text" ></div>
    <div class="text">담당자 이름</div>  
    <div class="ui input" style="width:100%"><input type="text" ></div>
    <div class="text">현재 날짜</div>     
    <div class="ui input" style="width:100%"><input type="text" ></div>
     <div class="actions">
     <br>
    <div class="ui a button">등록</div>
    <div class="ui cancel button">취소</div>
  </div>
    
    </div>
  </div>
</div>   
<!--=================================================================================  -->
	<div class="ui container">
	
		<table id="taable" class="ui celled table">

			<thead>
			<tr>
			<td colspan="2">
			<div class="ui secondary  menu">
  <a class="item" onclick="dept()">
    부서 예산 할당
  </a>
  <a class="item" onclick="back()">
    뒤로가기
  </a>

  
</div>
			</td>
			</tr>
				<tr>
					<th>총 지급액</th>
					<th>월별 지급액</th>
				</tr>
			</thead>
		</table>
	</div>
<!--=================================================================================  -->





	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>