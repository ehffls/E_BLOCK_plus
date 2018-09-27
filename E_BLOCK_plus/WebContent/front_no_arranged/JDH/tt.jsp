<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>



	<!--=============== 작성부분 ===============-->

	<div class="ui container" style="margin-top: 5px;">
		<!-- 검색창 시작  -->
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="users icon"></i>
					<div class="content">전체 출결</div>
				</h2>
			</div>
		</div>
		<table id="taable" class="ui fixed single line celled table">
			<thead>
				<tr>
					<th>Band</th>
					<th>Song</th>
					<th>Band</th>
					<th>Song</th>
					<th>Band</th>
					<th>Song</th>
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
		var table = $('#taable').DataTable({
			language : {                
				  "search": "검색 : ",
				  "info": "",
/* 				  "info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
				  "lengthMenu": "_MENU_"
			},
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
				},
				{
					"data" : "band"
				},
				{
					"data" : "song"
				},
				{
					"data" : "band"
				},
				{
					"data" : "song"
				}
			],
			columnDefs : [
				{
					targets : [0,1,2,3,4,5]
				   ,className : 'right aligned'
				}

			]
		});
		 
		$('#taable th').attr("class", "center aligned");
	
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
	</script>
	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>