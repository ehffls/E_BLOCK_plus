<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>거래처|비품종류</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>

	<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■[비품추가신청조회]■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

	<!--=============== 작성부분 ===============-->

	<div class="ui container" style="margin-top: 20px;">
		<div class="ui segment">
			<div class="ui form">
				<div class="two fields">
					<div class="eleven wide field">
						<div class="ui column stackable grid container">
							<div class="column" align="center" style="padding-left: 0px;">
								<h2 class="ui header" style="padding-top: 5px;">
									<i class="tasks icon"></i>
									<div class="content">거래처</div>
								</h2>
							</div>
						</div>
						<table id="taable" class="ui grey fixed single line celled table">
							<thead>
								<tr>
									<th>번호</th>
									<th>mk_cname</th>
									<th>mk_ename</th>
									<th>mk_ph</th>
									<th>mk_fax</th>
									<th>mk_email</th>
								</tr>
							</thead>
						</table>
							<div id="btn_1" class="orange ui button">거래처 추가</div>
					</div>
					<div class="five wide field">
						<div class="ui column stackable grid container">
							<div class="column" align="center" style="padding-left: 0px;">
								<h2 class="ui header" style="padding-top: 5px;">
									<i class="fax icon"></i>
									<div class="content">비품분류</div>
								</h2>
							</div>
						</div>
						<table id="taable2" class="ui grey fixed single line celled table">
							<thead>
								<tr>
									<th>mk_no</th>
								</tr>
							</thead>
						</table>
							<div id="btn_1" class="orange ui button">종류 추가</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {

			$('#btn_1').on(
					'click',
					function() {
						$('#modal_1').modal('setting', 'closable', false)
								.modal('show');
					});
			$('#okbtn_1').on('click', function() {
				location.href = "/E_BLOCK_plus/equip/mk/add.jsp";
			});
		});
	</script>
	<script>
		$.fn.dataTable.ext.errMode = '';
		var table = $('#taable2').DataTable({

			aLengthMenu : [ 10, 20, 30 ],
			language : {
				/* 				"info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
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
				}
			//페이지 네이션 버튼 한글로 변경
			},
			ajax : {
				url : "/E_BLOCK_plus/equip/sort/list.ebp",
				dataSrc : 'data'
			},
			columns : [ {
				"data" : "eq_sort"
			} ],
			columnDefs : [ {
				targets : [ 0 ],
				className : 'center aligned'
			}

			]
		});

		$('#taable2 th').attr("class", "center aligned");

		$('#taable2 tbody').on('click', 'tr', function() {
			if ($(this).hasClass('active')) {
				$(this).removeClass('active');
			} else {
				$(this).addClass('active');
			}
		});
		var table2 = $('#taable').DataTable({

			aLengthMenu : [ 10, 20, 30 ],
			language : {
				/* 				"info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
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
				}
			//페이지 네이션 버튼 한글로 변경
			},
			ajax : {
				url : "/E_BLOCK_plus/equip/all/list.ebp",
				dataSrc : 'data'
			},
			columns : [ {
				"data" : "mk_no"
			}, {
				"data" : "mk_cname"
			}, {
				"data" : "mk_ename"
			}, {
				"data" : "mk_ph"
			}, {
				"data" : "mk_fax"
			}, {
				"data" : "mk_email"
			} ],
			columnDefs : [ {
				targets : [ 1, 2, 3, 4, 5 ],
				className : 'right aligned'
			},
	        {
	           targets : [ 0 ], 
	           width: "10%",
	           className : 'center aligned'
	        }

			]
		});

		$('#taable th').attr("class", "center aligned");

		$('#taable tbody').on('click', 'tr', function() {
			if ($(this).hasClass('active')) {
				$(this).removeClass('active');
			} else {
				$(this).addClass('active');
			}
		});
	</script>
	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>