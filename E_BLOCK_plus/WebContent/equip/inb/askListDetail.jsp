<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
			<table id="table_Detail" class="ui grey fixed single line celled table">
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
					</tr>
				</thead>
			</table>
<script>
		var table2 = $('#table_Detail').DataTable({

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
				url : "/E_BLOCK_plus/equip/inb/askListDetail.ebp",
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
	</script>