<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>com_Spending</title>
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
			url : "./List_JSON.jsp",
			dataSrc : 'data'
		},
		columns : [
			{
				"data" : "band"
			},
			{
				"data" : "song"
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

</script>
	<div class="ui container">

		<table id="taable" class="ui celled table">

			<thead>
				<tr>
					<td colspan="2">
						<div class="ui secondary  menu">
							<a class="item">상세보기</a> <a class="item">수정</a> <a class="item">삭제</a>
						</div>
					</td>
				</tr>
				<tr>
					<th>회사총지출액</th>
					<th>회사월 지출액</th>
				</tr>

			</thead>
		</table>
	</div>




	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>