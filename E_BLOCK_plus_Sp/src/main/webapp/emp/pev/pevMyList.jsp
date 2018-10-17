<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사평가내역조회</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
<style>
.ui.disabled.input {
	opacity: 1;
}
</style>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>
	
	<!--=============== 작성부분 ===============-->
	<%
		Cookie[] cs_eno = request.getCookies();
		String ev_eno = null;
		if (cs_eno != null) {
			for (int i = 0; i < cs_eno.length; i++) {
				String cev_eno = cs[i].getName();
				if ("c_eno".equals(cev_eno)) {
					ev_eno = cs[i].getValue();
				}
			}
		}
		System.out.println("사원번호: " + ev_eno);
	%>
	<script type="text/javascript">
	
	$('#sm_pev').attr("class", "active item");
	$('#sm_pev_pevMy').attr("class", "active item");
	
	function pevMyUpdata(data) {
		$.ajax({
			method : "post",
			data : data,
			url : "./pevUpd.jsp",
			/* url : "/E_BLOCK_plus/emp/pev/myList.ebp?ev_eno="+ev_no, */
			success : function(result) {
				$("#pevUp").html(result);
				$('#e_name').val(data["e_name"]);
				$('#ev_eno').val(data["ev_eno"]);
				$('#tg_eno').val(data["tg_eno"]);
				$('#ev_content').val(data["ev_content"]);
				$('#ev_score').val(data["ev_score"]);
				setRating(data["ev_score"]);
				$("#pev_UpModal").modal('show');
				//alert($('.rating').rating('get rating'));
			},
			error : function(xhrObject) {
				alert(xhrObject.responseText);
			}
		});
	}
	</script>
	

	<div class="ui container" style="margin-top: 10px;">
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="file alternate outline icon"></i>
					<div class="content">인사평가 내역조회</div>
				</h2>
			</div>
		</div>
		<div class="ui segment">
			<table id="taable" class="ui grey fixed single line celled table">
				<thead>
					<tr>
						<th>평가일자</th>
						<th>대상사원번호</th>
						<th>대상사원이름</th>
						<th>분기번호</th>
						<th>평가점수</th>
						<th>평가점수비율</th>
						<th>평가상세보기</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
			<div id="pevUp"></div>

	<script>
	var ev_no= "<%=ev_eno%>";
		var table = $('#taable').DataTable({
			//"lengthChange": false, //페이지메뉴 없음 설정
			//페이지 메뉴 조회 수량 설정 
			//"lengthMenu": [[10, 25, 50, -1], ["10개", "25개", "50개", "All"]],
			aLengthMenu : [ 5, 10, 15 ],
			language : {
				/* 				  "info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
				"info" : "", //테이블 하단에 나오는  Showing 1 to 10 of 100 entries 빈칸으로 지정
				"infoEmpty" : "", //검색 후 테이블 하단에 나오는  Showing 1 to 10 of 100 entries 빈칸으로 지정
				"infoFiltered" : "", //검색 후 테이블 하단에 나오는 (filtered from 100 total entries) 빈칸으로 지정
				"emptyTable" : "데이터가 없습니다", //테이블에 데이터가 없을 때 나오는 문구 지정
				"zeroRecords" : "검색 결과가 없습니다", //검색 결과 없을때 나오는 문구 지정
				"sLoadingRecords" : "읽는중...",
				"sProcessing" : "처리중...",
				"search" : "검색 : ",
				"lengthMenu" : "_MENU_", //디폴트: "sLengthMenu": "Show _MENU_ entries",
				"paginate" : {
					"previous" : "이전",
					"next" : "다음"
				} //페이지 네이션 버튼 한글로 변경
			},
			ajax : {
				url : "/E_BLOCK_plus/emp/pev/myList.ebp?ev_eno="+ev_no,
				dataSrc : 'data'
			},
			columns : [
				{
					"data" : "ev_date"
				},
				{
					"data" : "tg_eno"
				},
				{
					"data" : "e_name"
				},
				{
					"data" : "qrt_no"
				},
				{
					"data" : "ev_score"
				},
				{
					"data" : "ratio"
				},
				{
					//수정하기 버튼
				}
			],
			columnDefs : [
				{
					targets : [ 0, 1, 2, 3, 4, 5, 6 ],
					className : 'center aligned'
				},
				{
					targets : [ 6 ],
					data : null,
					defaultContent : "<div class='ui small button'>상세보기</div>"
				}
			]
		});
	
		$('#taable th').attr("class", "center aligned");
		$('#taable tbody').on('click', 'div', function() {
			var data = table.row($(this).parents('tr')).data();
			pevMyUpdata(data);
		});

	</script>
	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>