<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비품입출 전체내역</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
<script type="text/javascript">
	$(function() {
		$('#sm_toMe').attr("class", "active item");
		$('#sm_toMe_equip').attr("class", "active item");
	});
</script>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>

	<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■[비품입출신청조회]■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

	<!--=============== 작성부분 ===============-->

	<div class="ui container" style="margin-top: 20px;">
		<div class="ui pointing menu">
			<a class="item" href="/E_BLOCK_plus/equip/add/askList.jsp">비품추가신청조회</a> <a class="item" href="/E_BLOCK_plus/equip/purc/askList.jsp">비품구매신청조회</a> <a class="item active" href="/E_BLOCK_plus/equip/inb/askList.jsp">비품입출신청조회</a>
		</div>
		<div class="ui segment">
			<!-- 검색창 시작  -->
			<div class="ui column stackable grid container">
				<div class="column" align="center" style="padding-left: 0px;">
					<h2 class="ui header" style="padding-top: 5px;">
						<i class="green list ul icon"></i>
						<div class="content">비품입출 전체내역</div>
					</h2>
				</div>
			</div>
			<table id="taable" class="ui grey fixed single line celled table">
				<thead>
					<tr>
						<th>입출번호</th>
						<th>비품분류</th>
						<th>비품이름</th>
						<th>신청사원</th>
						<th>신청부서</th>
						<th>결재부서</th>
						<th>신청일자</th>
						<th>결재일자</th>
						<th>종류</th>
					</tr>
				</thead>
			</table>
			<div align="center">
				<div class="ui orange buttons" id="btn_approval">
					<div class="ui button">선택</div>
					<div class="ui floating dropdown icon button">
						<i class="dropdown icon"></i>
						<div class="menu">
							<div class="item" id="btn_0">
								<i class="thumbs up icon"></i> 대여중
							</div>
							<div class="item" id="btn_1">
								<i class="thumbs down icon"></i> 신청가능
							</div>
							<div class="item" id="btn_">
								<i class="thumbs down icon"></i> 분실
							</div>
							<div class="item" id="btn_">
								<i class="thumbs down icon"></i> 파손
							</div>
							<div class="item" id="btn_">
								<i class="thumbs down icon"></i> 수리중
							</div>
							<div class="item" id="btn_">
								<i class="thumbs down icon"></i> 반입완료
							</div>
							<div class="item" id="btn_">
								<i class="thumbs down icon"></i> 폐기
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript">
					$('.ui.dropdown').dropdown();
				</script>
			</div>
		</div>
	</div>
	</div>
	<div class="ui modal" id="modal_1">
		<div class="header">비품 이력보기</div>
		<div class="ui segment" style="margin-right: 20px; margin-left: 20px" id="detail_modal"></div>
		<div class="actions">
			<div class="ui ok button">확인</div>
			<div class="ui black deny button">취소</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#ap_bp').attr('class', 'item active');
		});
		$.fn.dataTable.ext.errMode = '';
		var table = $('#taable').DataTable({
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
				url : "/E_BLOCK_plus/equip/inb/eqListState.ebp",
				dataSrc : 'data'
			},
			columns : [ {
				"data" : "eq_no"
			}, {
				"data" : "last_dname"
			}, {
				"data" : "last_ename"
			}, {
				"data" : "eq_sort"
			}, {
				"data" : "eq_name"
			}, {
				"data" : "inb_no"
			}, {
				"data" : "inb_date"
			}, {
				"data" : "last_date"
			}, {
				"data" : "inb_state"
			} ],
			columnDefs : [ {
				targets : [ 0, 1, 2, 3, 4, 5, 6, 7, 8 ],
				className : 'right aligned'
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
	
		$('#btn_1').on('click', function() {});
	
		$('#taable tbody').on('dblclick', 'tr', function() {
			$('#modal_1').modal('setting', 'closable', false).modal('show');
			$.ajax({
				method : 'get',
				url : './askListDetail.jsp',
				success : function(result) {
					$('#modal_1').modal('setting', 'closable', false).modal('show');
					$('#detail_modal').html(result);
				},
				error : function(XhrObject) {
					alert(XhrObject);
				}
			});
			table.$('tr.active').removeClass('active');
			$(this).addClass('active');
		});
	</script>
	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>
