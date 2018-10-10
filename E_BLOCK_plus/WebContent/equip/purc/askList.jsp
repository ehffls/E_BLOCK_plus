<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비품구매 전체내역</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>

	<!--■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■[비품입출신청조회]■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■ -->

	<!--=============== 작성부분 ===============-->

	<div class="ui container" style="margin-top: 20px;">
		<%@ include file="/front/_includePage/approval_head.jsp"%>
		<div class="ui pointing menu">
			<a class="item" href="../add/askList.jsp">비품추가신청조회</a> <a class="item active">비품구매신청조회</a> <a class="item">비품입출신청조회</a>
		</div>
		<div class="ui segment">
			<!-- 검색창 시작  -->
			<div class="ui column stackable grid container">
				<div class="column" align="center" style="padding-left: 0px;">
					<h2 class="ui header" style="padding-top: 5px;">
						<i class="tasks icon"></i>
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
						<th>상태</th>
					</tr>
				</thead>
			</table>
			<div id="btn_1" class="ui button">상세보기</div>
		</div>
	</div>
	</div>
	<div class="ui modal" id="modal_1">
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
				url : "/E_BLOCK_plus/equip/purc/askList.ebp",
				dataSrc : 'data'
			},
			columns : [ {
				"data" : "ask_eno"
			}, {
				"data" : "eq_sort"
			}, {
				"data" : "eq_name"
			}, {
				"data" : "ask_ename"
			}, {
				"data" : "ask_dname"
			}, {
				"data" : "sign_dname"
			}, {
				"data" : "ask_date"
			}, {
				"data" : "sign_date"
			}, {
				"data" : "io_ano"
			}, {
				"data" : "outcome"
			} ],
			columnDefs : [ {
				targets : [ 0, 1, 2, 3, 4, 5, 6, 7, 8],
				className : 'right aligned'
			}

			]
		});

		$('#taable th').attr("class", "center aligned");

		$('#taable tbody').on('click', 'tr', function() {
			
			//로우의 outcome값이 '취소' 또는 '기각' 또는 '입고완료'가 아닌 로우에 대하여
			if(table.row(this).data()["outcome"]=="대기"
					||table.row(this).data()["outcome"]=="승인"
					||table.row(this).data()["outcome"]=="결제완료"){
				
				//취소하기
				if ($(this).hasClass('active ro')) {
					$(this).removeClass('active ro');
					$('#btn_approval').transition('jiggle')//버튼 흔들어줌
				}
				
				//선택하기
				else {
					//선택되어져 있던 로우들 중 최초의 outcome값
					var f_outcome = null;
					$('.active.ro').each(function(index, element){
						f_outcome = $(this).children().eq(6).text();
						return;//먼저 선택된 결재상태의 문자값만 담고 반복each문 탈출
					});
					//(이후에)현재 선택한 로우의  outcome값
					var t_outcome = $(this).children().eq(6).text();
					
					//둘을 비교해서 같거나, 혹은 먼저 선택된 로우의 outcome값이 없으면
					if(f_outcome == t_outcome || f_outcome == null){
						$(this).addClass('active ro');//선택되도록 해줌
						$('#btn_approval').transition('jiggle')//버튼 흔들어줌
						//12321312
					}
				}
			}
		});

		$('#btn_1').on('click', function() {
			$('#modal_1').modal('setting', 'closable', false).modal('show');
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
			

			table.$('tr.active').removeClass('active');
			$(this).addClass('active');
		});
	</script>
	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>