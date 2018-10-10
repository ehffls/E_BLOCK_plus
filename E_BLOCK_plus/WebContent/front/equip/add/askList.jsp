<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내게온결재목록페이지</title>
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
		<%@ include file="/front/_includePage/approval_head.jsp"%>
		<div class="ui pointing menu">
			<a class="item active">비품추가신청조회</a> <a class="item" href="../purc/askList.jsp">비품구매신청조회</a> <a class="item">비품입출신청조회</a>
		</div>
		<div class="ui segment">
			<!-- 검색창 시작  -->
			<div class="ui column stackable grid container">
				<div class="column" align="center" style="padding-left: 0px;">
					<h2 class="ui header" style="padding-top: 5px;">
						<i class="tasks icon"></i>
						<div class="content">비품추가 신청내역</div>
					</h2>
				</div>
			</div>
			<table id="taable" class="ui grey fixed single line celled table">
				<thead>
					<tr>
						<th>신청번호</th>
						<th>비품분류</th>
						<th>비품이름</th>
						<th>신청사원번호</th>
						<th>신청일자</th>
						<th>상태</th>
					</tr>
				</thead>
			</table>
			<div id="btn_1" class="ui button">선택수정</div>
		</div>
	</div>
	</div>
	<div class="ui first coupled modal" id="modal_1">
		<div class="header">상세보기</div>
		<div class="ui segment" style="margin-right: 20px; margin-left: 20px">
			<div class="ui form">
				<div class="three fields">
					<div class="field">
						<label>신청번호</label> <input type="text" id="text_1" readonly>
					</div>
					<div class="field">
						<label>비품분류</label> <input type="text" id="text_2" readonly>
					</div>
					<div class="field">
						<label>비품이름</label> <input type="text" id="text_3" readonly>
					</div>
				</div>
			</div>
			<div class="ui form">
				<div class="three fields">
					<div class="field">
						<label>신청사원번호</label> <input type="text" id="text_4" readonly>
					</div>
					<div class="field">
						<label>신청일자</label> <input type="text" id="text_5" readonly>
					</div>
					<div class="field">
						<label>상태</label> <input type="text" id="text_6" readonly>
					</div>
				</div>
			</div>

		</div>
		<div class="actions">
			<div class="ui ok button">처리</div>
			<div class="ui black deny button">취소</div>
		</div>
	</div>
	<div class="ui second coupled modal" id="modal_2">
		<div class="header">상세보기</div>
		<div class="ui segment" style="margin-right: 20px; margin-left: 20px">
			<div class="ui form">
				<div class="three fields">
					<div class="field">
						<label>신청번호</label> <input type="text" id="text_1" readonly>
					</div>
					<div class="field">
						<label>비품분류</label> <input type="text" id="text_2" readonly>
					</div>
					<div class="field">
						<label>비품이름</label> <input type="text" id="text_3" readonly>
					</div>
				</div>
			</div>
			<div class="ui form">
				<div class="three fields">
					<div class="field">
						<label>신청사원번호</label> <input type="text" id="text_4" readonly>
					</div>
					<div class="field">
						<label>신청일자</label> <input type="text" id="text_5" readonly>
					</div>
					<div class="field">
						<label>상태</label> <input type="text" id="text_6" readonly>
					</div>
				</div>
			</div>

		</div>
		<div class="actions">
			<div class="ui ok button">확인</div>
			<div class="ui black deny button">취소</div>
		</div>
	</div>
	<script>
	$(function(){
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
				url : "/E_BLOCK_plus/equip/add/askList.ebp",
				dataSrc : 'data'
			},
			columns : [ {
				"data" : "eq_addno"
			}, {
				"data" : "eq_sort"
			}, {
				"data" : "eq_name"
			}, {
				"data" : "ask_eno"
			}, {
				"data" : "ask_date"
			}, {
				"data" : "outcome"
			} ],
			columnDefs : [ {
				targets : [ 0, 1, 2, 3, 4, 5 ],
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

		$('#btn_1').on('click', function() {
			var data2 = $('#taable').append($("tr")).hasClass('active').val();
		});

		$('#taable tbody').on('dblclick', 'tr', function() {
			var data = table.row(this).data();
			$('#text_1').val(data["eq_addno"]);
			$('#text_2').val(data["eq_sort"]);
			$('#text_3').val(data["eq_name"]);
			$('#text_4').val(data["ask_eno"]);
			$('#text_5').val(data["ask_date"]);
			$('#text_6').val(data["outcome"]);
			$('.coupled.modal').modal({
				allowMultiple : false
			});
			// attach events to buttons
			$('#modal_2').modal('attach events', '.first.modal .ok.button');
			$('#modal_1').modal('setting', 'closable', false).modal('show');

			table.$('tr.active').removeClass('active');
			$(this).addClass('active');
		});
	</script>
	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>