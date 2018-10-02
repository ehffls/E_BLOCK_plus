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




	<!--=============== 작성부분 ===============-->
	<script type="text/javascript">
		$(document).ready(function() {
			var table = $('#taable').DataTable({
				ajax : {
					url : "./account_JSON.jsp",
					dataSrc : 'data'
				},
				columns : [
					{
						"data" : "band"
					},
					{
						"data" : "song"
					},
					{
						"data" : "son"
					}
				]
			});
	
			$('#taable tbody').on('click', 'tr', function() {
				var data = table.row(this).data();
				alert(data["band"]);
	
				if ($(this).hasClass('active')) {
					$(this).removeClass('active');
				} else {
					table.$('tr.active').removeClass('active');
					$(this).addClass('active');
				}
			});
	
		});
		function ac2(){
			
			location.href="./account2.jsp"
		}
	
		function ac_add() {
			$('#acc_add').modal('show')
		}
	</script>
	<div class="ui mini modal" id="acc_add">
		<div class="header">거래처 등록</div>

		<div class="content">
			<div class="bady">
				<div class="text">회사 이름</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<div class="text">담당자 이름</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<div class="text">회사 이름</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<div class="text">연락처</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<div class="text">팩스번호</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<div class="text">이메일</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<div class="actions">
					<br>
					<div class="ui a button">등록</div>
					<div class="ui cancel button">취소</div>
				</div>

			</div>
		</div>
	</div>
	<div class="ui container">




		<table id="taable" class="ui celled table">

			<thead>
				<tr>
				<td colspan="3">
					<div class="ui secondary  menu">
						<a class="item" onclick="ac2()"> 거래처 상세보기 </a>
						<a class="item" onclick="ac_add()"> 거래처 등록 </a>
						 <a class="item"> 거래처 삭제 </a> 
						 <a class="item"> 거래처 수정 </a>
						 
					</div>
					</td>
				</tr>
				<tr>
					<th>거래처명</th>
					<th>담당자</th>
					<th>연락처</th>
				</tr>
				
			</thead>
		</table>
	</div>

	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>