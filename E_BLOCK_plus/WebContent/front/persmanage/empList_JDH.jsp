
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>



	<!--=============== 작성부분 ===============-->
	
<script type="text/javascript">
function eSeachList(){
	$.ajax({
		method:"get"
	   ,url:"./empSearch.jsp"
	   ,success:function(result){
		   $("#eSeachList").html(result);
	   }
	});
}
</script>
	

	<div class="ui container" style="margin-top: 5px;">
		<!-- 검색창 시작 -->
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="address book outline icon"></i>
					<div class="content">사원 관리</div>
				</h2>
			</div>
		</div>

		<div class="ui grey five item menu">
			<a class="item" onclick="eSeachList()"> 사원 조회 </a> 
			<a class="item" onclick=""> 사원 등록 </a>
			<a class="item" onclick=""> 계약 변경 </a>
			<a class="item" onclick=""> 부서배정 </a>
			<a class="item" onclick=""> 부서이동 </a>
		</div>
		<div id="eSeachList"></div>
	</div>

	<script>
	//사이드 메뉴 설정
	$('#sm_persmanage').attr("class","active item");
	$('#sm_persmanage_emp').attr("class","active item");	
	</script>



	
	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>