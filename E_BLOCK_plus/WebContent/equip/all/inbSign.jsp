<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 결제</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




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

	function menu_add(){
		
		location.href="./inbSign2.jsp"
	}
</script>
<div class="ui container">  
		<div class="ui red two item menu">
  	<a class="item active" id="menu" >
 	   현재물품신청
  	</a>
  	<a class="item" id="menu_add"onclick="menu_add()">
  	  추가물품신청
  	</a>

</div>
	
			
	<table id="taable" class="ui celled table">

			<thead>
				<tr>
					<th>물품명</th>
					<th>가격</th>
				</tr>
				
			</thead>
		</table>
</div>
<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>