
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태  결재 승인 내역</title>
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

	<div class="ui container" style="margin-top: 5px;">
		<!-- 검색창 시작  -->
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="paste icon"></i>
					<div class="content">근태 결재 승인 내역</div>
				</h2>
			</div>
		</div>
		<table id="taable" class="ui grey fixed single line celled table">
			<thead>
				<tr>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>6</th>
					<th>7</th>
					<th>8</th>
				</tr>
			</thead>
		</table>
	</div>

	<script>
	//사이드 메뉴 설정
		$('#sm_persmanage').attr("class","active item");
		$('#sm_persmanage_aplist').attr("class","active item");
	
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
			//"lengthChange": false, //페이지메뉴 없음 설정
			//페이지 메뉴 조회 수량 설정 
			//"lengthMenu": [[10, 25, 50, -1], ["10개", "25개", "50개", "All"]],
			aLengthMenu : [10, 20, 30],
			language : {
/* 				  "info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
				  "info": "",//테이블 하단에 나오는  Showing 1 to 10 of 100 entries 빈칸으로 지정
				  "infoEmpty": "",//검색 후 테이블 하단에 나오는  Showing 1 to 10 of 100 entries 빈칸으로 지정
				  "infoFiltered": "",//검색 후 테이블 하단에 나오는 (filtered from 100 total entries) 빈칸으로 지정
				  "emptyTable": "데이터가 없습니다",//테이블에 데이터가 없을 때 나오는 문구 지정
				  "zeroRecords": "검색 결과가 없습니다",//검색 결과 없을때 나오는 문구 지정	
				  "search": "검색 : ",
				  "lengthMenu": "_MENU_",//디폴트: "sLengthMenu": "Show _MENU_ entries",
 				  "paginate": {
						           "previous": "이전",
						           "next": "다음"
					          }//페이지 네이션 버튼 한글로 변경
			},
			ajax : {
				url : "attdToMeList_JSON.jsp",
				dataSrc : 'data'
			},
			columns : [
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				}
			],
			columnDefs : [
				{
					targets : [0,1,2,3,4,5,6,7]
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