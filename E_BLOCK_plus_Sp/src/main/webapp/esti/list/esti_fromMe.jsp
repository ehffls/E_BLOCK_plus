<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 신청한 견적서</title>

<!-- 공통소스 시작 -->
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<!-- 공통소스 끝-->

</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>

	<!-- DOM구성이후 테이블 갈아끼우기 시작 -->
	<script type="text/javascript">
	//전역변수
	var hiddenPageNum = 1;
	
	//DOM구성으로 테이블 갈아끼우기
	$(document).ready(function(){
		
		//차장급이 결재 완료된 나의 신청건 조회
		$.ajax({
		 	 method:'get'
			,url:'./esti_phase1.jsp'
			,success:function(page){
				$("#phase_1").html(page);	
			 }
			,error:function(xhrObject) {
				alert(xhrObject.responseText);
			 }
		});
		
		
		//부서장급이 결재 완료된 나의 신청건 조회
		$.ajax({
		 	 method:'get'
			,url:'./esti_phase2.jsp'
			,success:function(page){
				$("#phase_2").html(page);	
			 }
			,error:function(xhrObject) {
				alert(xhrObject.responseText);
			 }
		});
		
		
		//모두 결재 완료된 나의 신청건 조회
		$.ajax({
		 	 method:'get'
			,url:'./esti_phase3.jsp'
			,success:function(page){
				$("#phase_3").html(page);	
			 }
			,error:function(xhrObject) {
				alert(xhrObject.responseText);
			 }
		});
	});
	</script>
	<!-- DOM구성이후 테이블 갈아끼우기 끝 -->


	<!-- 겉박스 시작 -->
	<div class="ui container" style="margin-top: 20px;">

		<!-- 상단바 시작 -->
		<div class="ui icon message">
			<i class="paper plane icon"></i>
			<div class="content">
				<div class="header">견적서 발급요청 목록</div>
				<p>아래 탭을 통해 상태별로 확인할 수 있습니다.</p>
			</div>
			<!-- 상단 버튼 시작 -->
			<div align="center">
				<button class="ui teal large icon button" onclick="previous()">
					<i class="caret left icon"></i>
				</button>
				&nbsp;&nbsp;&nbsp;
				<button class="ui teal large icon button" onclick="forward()">
					<i class="caret right icon"></i>
				</button>
			</div>
			<!-- 상단 버튼 끝 -->
			<!-- 상단버튼 이벤트 스크립트 시작 -->
			<script type="text/javascript">
				//이전이동
				function previous(){
					if(hiddenPageNum==1){
						$("#tap-1").attr("class","item");//상단메뉴탭 이벤트처리
						$("#tap-3").attr("class","active item");
						$('.menu .item').tab('change tab', 'tab_complete');//하단탭이동 이벤트처리
						hiddenPageNum = 3;//변환상수값 변경
						
					}else if(hiddenPageNum==2){
						$("#tap-2").attr("class","item");//상단메뉴탭 이벤트처리
						$("#tap-1").attr("class","active item");
						$('.menu .item').tab('change tab', 'tab_standby');//하단탭이동 이벤트처리
						hiddenPageNum = 1;//변환상수값 변경
						
					}else if(hiddenPageNum==3){
						$("#tap-3").attr("class","item");//상단메뉴탭 이벤트처리
						$("#tap-2").attr("class","active item");
						$('.menu .item').tab('change tab', 'tab_apprval');//하단탭이동 이벤트처리
						hiddenPageNum = 2;//변환상수값 변경
					}
				}
				//다음이동
				function forward(){
					if(hiddenPageNum==1){
						$("#tap-1").attr("class","item");//상단메뉴탭 이벤트처리
						$("#tap-2").attr("class","active item");
						$('.menu .item').tab('change tab', 'tab_apprval');//하단탭이동 이벤트처리
						hiddenPageNum = 2;//변환상수값 변경
						
					}else if(hiddenPageNum==2){
						$("#tap-2").attr("class","item");//상단메뉴탭 이벤트처리
						$("#tap-3").attr("class","active item");
						$('.menu .item').tab('change tab', 'tab_complete');//하단탭이동 이벤트처리
						hiddenPageNum = 3;//변환상수값 변경
						
					}else if(hiddenPageNum==3){
						$("#tap-3").attr("class","item");//상단메뉴탭 이벤트처리
						$("#tap-1").attr("class","active item");
						$('.menu .item').tab('change tab', 'tab_standby');//하단탭이동 이벤트처리
						hiddenPageNum = 1;//변환상수값 변경
					}
				}
			</script>
			<!-- 상단버튼 이벤트 스크립트 끝-->
		</div>
		<!-- 상단바 끝 -->






		<!-- 탭 시작 -->
		<!-- 탭 대분류 시작 -->
		<div class="ui pointing secondary menu">
			<a id="tap-1" class="item active" data-tab="tab_standby" onclick="setNum(1)">대기중</a>
			<a id="tap-2" class="item" data-tab="tab_apprval" onclick="setNum(2)">진행중</a>
			<a id="tap-3" class="item" data-tab="tab_complete" onclick="setNum(3)">결재완료</a>
		</div>
		<!-- 탭 대분류 끝 -->

		<!-- a태그 버튼이벤트 설정 시작 -->
		<script type="text/javascript">
			function setNum(value){
				hiddenPageNum = value;
			}
		</script>
		<!-- a태그 버튼이벤트 설정 끝 -->

		<!-- 탭 대분류-1 시작 :: 대기중 -->
		<div class="ui tab segment active" data-tab="tab_standby">
			<!-- DataTables 시작 -->
			<table id="taable" class="ui grey fixed single line celled table">
				<thead>
					<tr>
						<th>견적신청번호</th>
						<th>카탈로그번호</th>
						<th>제품명</th>
						<th>가격</th>
						<th>신청일자</th>
						<th>상태값</th>
						<th>신청이메일주소</th>
						<th>비고</th>
					</tr>
				</thead>
			</table>
			<!-- DataTables 끝-->
		</div>
		<!-- 탭 대분류-1 끝 -->


		<!-- 탭 대분류-2 시작 :: 진행중 2개 작은탭-->
		<div class="ui tab segment" data-tab="tab_apprval">
			<div class="ui top attached tabular menu">
				<a class="item active" data-tab="tab_apprval/phase1">차장급이 결재 완료된 나의 신청건 조회</a>
				<a class="item" data-tab="tab_apprval/phase2">부서장급이 결재 완료된 나의 신청건 조회</a>
			</div>
			<div class="ui bottom attached tab segment active" data-tab="tab_apprval/phase1">
				<div id="phase_1"></div>
			</div>
			<div class="ui bottom attached tab segment" data-tab="tab_apprval/phase2">
				<div id="phase_2"></div>
			</div>
		</div>
		<!-- 탭 대분류-2 끝 -->


		<!-- 탭 대분류-3 시작 :: 완료-->
		<div class="ui tab segment" data-tab="tab_complete">
			<div id="phase_3"></div>
		</div>
		<!-- 탭 대분류-3 끝 -->
		<!-- 탭 끝 -->





		<!-- 탭 스크립트 시작 -->
		<script type="text/javascript">
			//상단 메뉴의 아이템이 탭이벤트가 작동하도록 이벤트 설정
			$('.menu .item').tab();
		</script>
		<!-- 탭 스크립트 끝 -->




		<!-- 수정모달 시작 -->
		<div class="ui modal" id="modal_selectUpd">
			<div class="header">선택요청 수정하기</div>
			<div class="ui segment divided grid" style="margin-right: 20px; margin-left: 20px">
				<div class="two wide column">
					<form id="f_esmt">
						<div class="ui form">
							<div class="field">
								<label>대상신청번호</label>
								<div class="ui disabled input">
									<input type="text" id="pesti_ano" readonly="readonly">
								</div>
							</div>
							<div class="field">
								<label>카탈로그번호</label> <input type="text" id="pec_no" placeholder="" readonly="readonly">
							</div>
							<div class="field">
								<label>이메일주소</label> <input type="text" id="pesti_email" placeholder="account@email.com">
							</div>
							<div class="field">
								<label>변경 비고</label> <input type="text" id="pcontent" placeholder="변경사항을 입력하세요.">
							</div>
						</div>
					</form>
				</div>
				<div class="fourteen wide column">
					<!-- mini_table 시작 -->
					<table id="mini_table" class="ui grey single line celled table" style="width:100%">
						<thead>
							<tr>
								<th>카탈로그번호</th>
								<th>제품명</th>
								<th>단가</th>
							</tr>
						</thead>
					</table>
					<!-- mini_table 끝-->
				</div>
			</div>

			<!-- 버튼/이벤트 시작 -->
			<div class="actions">
				<div id="div_allUpd" class="ui approve grey button">일괄수정하기</div>
				<div class="ui cancel button">닫기</div>
			</div>
			<!-- 버튼/이벤트 끝 -->

		</div>
		<!-- 수정요청하기 버튼 시작 -->
		<script type="text/javascript">
			$("#div_allUpd").on('click',function(){
				$("#f_esmt").attr("method","post");
				$("#f_esmt").attr("action","/E_BLOCK_plus/esti/catalog/insupd");  
				$("#f_esmt").submit();
				alert("신청되었습니다.");
			});
		</script>
		<!-- 수정요청하기 버튼 끝 -->
		<!-- 수정모달 끝 -->








		<!-- DataTables스크립트 시작 -->
		<script type="text/javascript">
		$.fn.dataTable.ext.errMode = '';//null 에러 오류 따로 안띄우게
		//데이터테이블 자료뿌리기
		var table = $('#taable').DataTable({
			//조회개수 조정
			aLengthMenu : [ 5, 10, 15 ],
		       //페이지 네이션 버튼 한글로 변경
			language : {
		           /*
		           "info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
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
			},
			//json데이터를 요청하는 ajax옵션
			ajax:{
				//내가 요청한 견적시신청건 중 대기중인 신청건(결재가 하나도 진행되지 않음) ({path})
				url : "/E_BLOCK_plus/esti/list/list/phase0",//"./esti_fromMe_JSON.jsp",
		           dataSrc : 'data' //넘겨오는 자료 매핑이름
			},
			columns : [ {
		           "data" : "ESTI_ANO" //견적신청번호
		        }, {
		           "data" : "EC_NO" //카탈로그번호
		        }, {
		           "data" : "EC_NAME"//제품명
		        }, {
		           "data" : "ESTI_PRICE"//가격
		        }, {
		           "data" : "ASK_DATE"//신청일자
		        }, {
		           "data" : "OUTCOME1"//상태값
		        }, {
		           "data" : "ESTI_EMAIL"//신청이메일주소
		        }, {
		           "data" : "NOTE"//비고
		        } ],
		       columnDefs : [ {
		          targets : [ 0, 1, 2, 3, 4, 5, 6, 7 ],
		           //width: "12%",
		        className : 'center aligned'
		        
		       } ]
		});
		
		//테이블 헤더 가운데 정렬
		$('#taable th').attr("class", "center aligned");
		
		//단일선택이벤트 설정
		$('#taable tbody').on('click', 'tr', function() {
	   		//선택되어있을 때,
			if ($(this).hasClass('active ro')) {
	        	$(this).removeClass('active ro');
	        	//$('#btn_ask').transition('horizontal flip in')//신청버튼 흔들어줌
	       	}
	   		//아닐때,
	   		else{
	   			//기존에 선택된 것들을 모두 선택해제로 바꿈
	   			$('.active.ro').each(function(index, element){
	        		$(this).removeClass('active ro');
	            });
	   			$(this).addClass('active ro');
	        	$('#btn_ask').transition('horizontal flip in')//신청버튼 흔들어줌
	   		}
	   });
	
	//수정모달열기 : 더블클릭 및 버튼클릭 
	$('#taable tbody').on('dblclick', 'tr', function() {
       	//alert("감지");
		var data = table.row(this).data();
		
		$('#pesti_ano').val(data["ESTI_ANO"]);	//견적신청번호 넘김
		$('#pec_no').val(data["EC_NO"]);		//카탈로그번호 넘김
		$('#pesti_email').val(data["ESTI_EMAIL"]);//제품명 넘김
		$('#pcontent').val(data["NOTE"]);	//비고 넘김
       	
		$('#modal_selectUpd').modal('setting', 'closable', false).modal('show');
    });
	
	</script>
	<!-- DataTables스크립트 끝-->




	<!-- mini_table스크립트 시작 -->
	<script type="text/javascript">
	//데이터테이블 자료뿌리기
	var m_table = $('#mini_table').DataTable({
		//조회개수 조정
		aLengthMenu : [ 5, 10, 15 ],
		//aLengthMenu : null,
	       //페이지 네이션 버튼 한글로 변경
		language : {
	           /*
	           "info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
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
		},
		//json데이터를 요청하는 ajax옵션
		ajax:{
			//카탈로그 전체 조회
			url : "/E_BLOCK_plus/esti/catalog/list",//"../catalog/esti_list_JSON.jsp",
	        dataSrc : 'data' //넘겨오는 자료 매핑이름
		},
		columns : [ {
	           "data" : "EC_NO" //카탈로그번호
	        }, {
	           "data" : "EC_NAME"//제품명
	        }, {
	           "data" : "EC_PRICE"//가격
	        } ],
	       columnDefs : [ {
	          targets : [ 0, 1, 2 ],
	           //width: "12%",
	        className : 'center aligned'
	       },{
	          targets : [ 0, 2 ],
	       searchable : false //화면에서 보이나 검색대상에서 제외
	       }
	       ]
	});
	
	//테이블 헤더 가운데 정렬
	$('#mini_table th').attr("class", "center aligned");
	
	//단일선택이벤트 설정
	$('#mini_table tbody').on('click', 'tr', function() {
   		//선택되어있을 때,
		if ($(this).hasClass('active sro')) {
        	$(this).removeClass('active sro');
       	}
   		//아닐때,
   		else{
   			//기존에 선택된 것들을 모두 선택해제로 바꿈
   			$('.active.sro').each(function(index, element){
        		$(this).removeClass('active sro');
            });
   			$(this).addClass('active sro');
   		}
    });
	</script>
	<!-- mini_table스크립트 끝-->


	</div>
	<!-- 겉박스 끝 -->



</body>
</html>