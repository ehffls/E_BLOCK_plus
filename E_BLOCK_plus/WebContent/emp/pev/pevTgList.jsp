<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>평가 대상 조회</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />

</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>

	<!--=============== 작성부분 ===============-->
	<%
		Cookie[] cs_no = request.getCookies();
		String ev_eno = null;
		String d_no = null;
		if (cs != null) {
			for (int i = 0; i < cs.length; i++) {
				String c_no = cs[i].getName();
				if ("c_eno".equals(c_no)) {
					ev_eno = cs[i].getValue();
				}
				else if ("c_dno".equals(c_no)) {
					d_no = cs[i].getValue();
				}
			}
		}
		System.out.println("사원번호: " + ev_eno);
		System.out.println("부서번호: " + d_no);
	%>


	<div class="ui container" style="margin-top: 10px;">
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="clipboard outline icon"></i>
					<div class="content">평가대상조회</div>
				</h2>
			</div>
		</div>
		<div class="ui segment">
			<div class="ui two column divided grid">
				<div class="column" align="center" style="padding-left: 12px;">
					<table id="taable" class="ui grey fixed single line celled table">
						<thead>
							<tr>
								<th>평가대상직급</th>
								<th>평가대상이름</th>
								<th>평가하기</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="column">
					<div id="pev_AddForm"></div>
				</div>
			</div>
		</div>
	</div>


	<script>
	var eno= "<%=ev_eno%>";
	var dno= "<%=d_no%>";

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
					url : "/E_BLOCK_plus/emp/pev/tgList.ebp?e_no="+eno+"&d_no="+dno,
					dataSrc : 'data'
				},
		
				columns : [
					{
						"data" : "e_rank"
					},
					{
						"data" : "e_name"
					},
					{
						//평가하기 버튼
					}
		
				],
				columnDefs : [
					{
						targets : [ 0, 1, 2 ],
						className : 'center aligned'
					},
					{
						targets : [ 2 ],
						data : null,
						defaultContent : "<div class='ui small button'>수정</div>"
					}
				]
			});
			$('#taable th').attr("class", "center aligned");
			$('#taable tbody').on('click', 'div', function() {
					//alert(this.id);
					var data = table.row($(this).parents('tr')).data();
					pevMyAdd(data["e_name"]);
			});
			
			function pevMyAdd(data) {
				$.ajax({
					method : "post",
					url : "/E_BLOCK_plus/emp/pev/pevAdd.jsp?e_name="+data,
					success : function(result) {
						$("#pev_AddForm").html(result);
					},
					error : function(xhrObject) {
						alert(xhrObject.responseText);
					}
				});
			}
	        function pevAddTg(){
	    		var new_score = $('.rating').rating('get rating')*2;
	        	alert(new_score);
	        	$("#ev_score").val(new_score);
	    		$("#pev_AddForm").attr("method","post");
	    		$("#pev_AddForm").attr("action","/E_BLOCK_plus/emp/pev/add.ebp");
	    		$("#pev_AddForm").submit();
	    	}
		</script>

	<!--=============== 작성부분 ===============-->

	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>