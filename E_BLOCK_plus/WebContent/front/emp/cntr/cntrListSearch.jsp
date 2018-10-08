<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>사원 관리</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
<body>

	<!--=============== 작성부분 ===============-->
<script type="text/javascript">

	function empUpdate(data) {
		$.ajax({
			method : "get",
			url : "./cntrUpdEmp.jsp?e_no="+data,
			success : function(result) {
				$("#UpdEmp").html(result);
				$("#emp_modal").modal('show');
			},
			error : function(xhrObject) {
				alert(xhrObject.responseText);
			}
		});
	}
	
	function deptUpdate(data) {
		//alert(data);
		$.ajax({
			method : "get",
			url : "./cntrSetDept.jsp?e_no="+data,
			success : function(result) {
				$("#SetDept").html(result);
				$("#dept_modal").modal('show');
			},
			error : function(xhrObject) {
				alert(xhrObject.responseText);
			}
		});
	}

	</script>	


	<div class="ui segment">
		<div class="ui container">
			<div class="ui grid" style="padding-top: 10px; padding-bottom: 10px;">
				<div class="row" style="padding-bottom: 5px;">
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
						<th>부서이름</th>
						<th>사원번호</th>
						<th>사원명</th>
						<th>사원직급</th>
						<th>권한번호</th>
						<th>계약 변경</th>
						<th>부서 배정 & 수정</th>
					</tr>
				</thead>
			</table>
		</div>
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
				url : "/E_BLOCK_plus/emp/info/empList.ebp",
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
					"data" : "au_no"
				},
				{
					//계약 변경 버튼
				},
				{
					//부서 배정 &수정 버튼
				}
	
			],
			columnDefs : [
				{
					targets : /* "_all" */ [ 0, 1, 2, 3, 4, 5, 6 ],
					className : 'center aligned'
				},
				{
					targets : [ 5 ],
					data : null,
					defaultContent : "<div class='ui small button' id='b_change' value ='변경' >변경</div>"
				},
				{
					targets : [ 6 ],
					data : null,
					defaultContent : "<div class='ui small button' id='b_edit' >수정</div>"
				}
	
			/* 
				    {
				         "targets": [ 6 ],
				         "visible": false, //화면에 출력, 비출력 설정
				         "searchable": false //화면에서 검색가능, 검색 불가 설정
				    },
				    {
				         "targets": [ 7 ],
				         "visible": false, //화면에 출력, 비출력 설정
				         "searchable": false //화면에서 검색가능, 검색 불가 설정
				    } 
				    {
				         "targets": [ 1 ],
				         "visible": false,
				         "searchable": false
				    },
				    {
				         "targets": [ 1 ],
				         "visible": true,
				         "searchable": false
				    } 
				    */
			]
		});
		$('#taable th').attr("class", "center aligned");
		/* 	
		 		$('#taable tbody').on('click', 'tr', function() {
					var data = table.row(this).data();
						alert(data["e_no"]); 
					
					if ($(this).hasClass('active')) {
						$(this).removeClass('active');
					} else {
						table.$('tr.active').removeClass('active');
						$(this).addClass('active');
					}
					
				});
		 		 */
		$('#taable tbody').on('click', 'div', function() {
 			//var data = table.row($(this).parents('tr')).data();
			//alert(data["e_name"]);
 //			if (document.getElementById('b_change')!=null) {
			if (this.id == 'b_change') {
			    //alert(this.id);
				var data = table.row($(this).parents('tr')).data();
				//alert(data["e_no"]);
			    empUpdate(data["e_no"]);	

			} 
			else if(this.id == 'b_edit') {
			    //alert(this.id);
				var data = table.row($(this).parents('tr')).data();
				//alert(data["e_no"]);
				deptUpdate(data["e_no"]);
 			}
		});
	
		//캘린더 시작일, 종료일 
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
	<!--=============== 작성부분 ===============-->

</body>
</html>