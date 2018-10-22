
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 출결 페이지</title>
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
	Cookie[] cs_dname = request.getCookies();
	String d_name = null;
	if (cs_dname != null) {
		for (int i = 0; i < cs_dname.length; i++) {
			String cdname = cs[i].getName();
			if ("c_dname".equals(cdname)) {
				d_name = cs[i].getValue();
			}
		}
	}
	System.out.println("사원번호: " + d_name);
	%>


	<div class="ui container" style="margin-top: 5px;">
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="teal users icon"></i>
					<div class="content">전체 출결</div>
				</h2>
			</div>
		</div>
		<div class="ui segment">
			<div class="ui grid">
				<div class="row" style="padding-bottom: 5px; padding-top: 10px;">
					<div class="eight wide column"></div>
					<div class="one wide column"></div>
					<div class="three wide column">
						<div class="ui calendar" id="r_start" align="right" style="margin-bottom: 5px;">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" placeholder="시작일자" />
							</div>
						</div>
					</div>
					<div class="four wide column ">
						<div class="ui calendar" id="r_end" align="right" style="margin-bottom: 5px;">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input id="r_end" type="text" placeholder="종료일자">
							</div>
						</div>
					</div>
				</div>
			</div>

			<table id="taable" class="ui grey fixed single line celled table">
				<thead>
					<tr>
						<th>부서명</th>
						<th>사원번호</th>
						<th>사원명</th>
						<th>직급</th>
						<th>일자</th>
						<th>출결</th>
						<th>출근시간</th>
						<th>퇴근시간</th>
						<th>상태</th>
						<th>재실유무</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>


	<script type="text/javascript">
		//캘린더 설정
		$(function() {
			$('#r_start').calendar({
				type : 'date',
				endCalendar : $('#r_end')
			});
			$('#r_end').calendar({
				type : 'date',
				startCalendar : $('#r_start')
			});
		});
	</script>


	<script>
	var d_name= "<%=d_name%>";
		//사이드 메뉴 설정
		$('#sm_emp').attr("class", "active item");
		$('#sm_emp_cmt').attr("class", "active item");
	
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
			aLengthMenu : [ 10, 20, 30 ],
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
				url : "/E_BLOCK_plus/emp/cmt/deptList?d_name="+d_name,
				dataSrc : 'data'
			},
			columns : [
				{
					"data" : "d_name"
				},
				{
					"data" : "e_no"
				},
				{
					"data" : "e_name"
				},
				{
					"data" : "e_rank"
				},
				{
					"data" : "cmt_date"
				},
				{
					"data" : "attend"
				},
				{
					"data" : "first_check"
				},
				{
					"data" : "last_check"
				},
				{
					"data" : "lv_state"
				},
				{
					"data" : "io_state"
				}
			],
			columnDefs : [
				{
					targets : [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ],
					className : 'center aligned'
				},
				{
					"targets" : [ 1 ],
					"visible" : false, //화면에 출력, 비출력 설정
					"searchable" : false //화면에서 검색가능, 검색 불가 설정
				},
				{
					"targets" : [ 3 ],
					"visible" : false, //화면에 출력, 비출력 설정
					"searchable" : false //화면에서 검색가능, 검색 불가 설정
				}
			/* 		        {
					             "targets": [ 1 ],
					             "visible": false,
					             "searchable": false
					        },
					        {
					             "targets": [ 1 ],
					             "visible": true,
					             "searchable": false
					        } */
			]
		});
	
		$('#taable th').attr("class", "center aligned");
	
		$('#taable tbody').on('click', 'tr', function() {
			var data = table.row(this).data();
				/* alert(data["e_no"]);
				alert(data["e_rank"]); */
	
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