<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나에게 온 신청 결재하기</title>

	<!-- 공통소스 시작 -->
	<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
	<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
	<!-- 공통소스 끝-->

<!-- 현재날짜박기함수 시작 /자동갱신 막은 상태 -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
<script type="text/javascript">
	function printClock() {
	    
	    var clock = document.getElementById("clock");            // 출력할 장소 선택
	    var currentDate = new Date();                                     // 현재시간
	    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
	    var amPm = 'AM'; // 초기값 AM
	    var currentHours = addZeros(currentDate.getHours(),2); 
	    var currentMinute = addZeros(currentDate.getMinutes() ,2);
	    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	    
	    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
	    	amPm = 'PM';
	    	currentHours = addZeros(currentHours - 12,2);
	    }
	    
	    clock.innerHTML = calendar+" "+currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:12px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
	    
	    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
	}
	
	function addZeros(num, digit) { // 자릿수 맞춰주기
		  var zero = '';
		  num = num.toString();
		  if (num.length < digit) {
		    for (i = 0; i < digit - num.length; i++) {
		      zero += '0';
		    }
		  }
		  return zero + num;
	}
</script>
<!-- 현재날짜박기함수 끝 /자동갱신 막은 상태 -->

</head>
<body onload="printClock()">

   <!-- sidebar -->
   <%@ include file="/front/_includePage/sidemenu.jsp"%>
   <!-- main -->
   <%@ include file="/front/_includePage/mainpage.jsp"%>

  
<!-- 겉박스 시작 -->
<div class="ui container" style="margin-top: 20px;">
	
	
	<!-- 상단바 시작 -->
	<div class="ui icon message">
		<i class="yellow bell icon"></i>
			<!-- 움찔 이벤트 스크립트 시작 -->
			<script type="text/javascript">
				$('.bell.icon')
				.transition('set looping')
				.transition('jiggle','1500ms');
			</script>
			<!-- 움찔 이벤트 스크립트 끝 -->
		<div class="content">
			<div class="header">나에게 온 결재 목록</div>
			<!-- 현재날짜박기함수 박히는 위치 -->
			<p>결재 반영 일자 : <span id="clock"></span></p>
		</div>
	</div>
	<!-- 상단바 끝 -->
	
	

<!-- 좌우 나누기 -->
<div class="ui divided grid segment">
<!-- 좌측 시작 -->
<div class="twelve wide column" align="center" style="padding-left: 12px;">

	<!-- 카탈로그 조회목록 시작 -->
	<table id="taable" class="ui grey fixed single line celled table">
		<thead>
			<tr>
				<th>견적신청번호</th>
				<th>카탈로그번호</th>
				<th>제품명</th>
				<th>가격</th>
				<th>1단계결재</th>
				<th>2단계결재</th>
				<th>비고</th>
			</tr>
		</thead>
	</table>
	<!-- 카탈로그 조회목록 끝 -->
	
</div>
<!-- 좌측 끝 -->

<!-- 우측 시작 -->
<div class="four wide column grid" style="padding-left: 12px;">
	<div id="right_space">
		<!-- 중앙정렬 시킬 아이콘과 안내문구 시작 -->
		<br><br><br><br><br><br><br>
		<div class="ui middle aligned" align="center">
			<i class="huge orange comment icon"></i><br>
				<!-- 움찔 이벤트 스크립트 시작 -->
					<script type="text/javascript">
						$('.comment.icon')
						.transition('set looping')
						.transition('tada','1500ms');
					</script>
				<!-- 움찔 이벤트 스크립트 끝 -->
			<h4 class="ui orange header">좌측에서 신청 건을 선택하세요.</h4>
		</div>
		<!-- 중앙정렬 시킬 아이콘과 안내문구 끝 -->
	</div>
</div>
<!-- 우측 끝 -->
</div>
<!-- 좌우나누기 끝 -->
</div>
<!-- 겉박스 끝 -->

	<!-- 카탈로그용 DataTables스크립트 시작-->
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
			//url :"",
			url : "./esti_fromMe_JSON.jsp",
	           dataSrc : 'data' //넘겨오는 자료 매핑이름
		},
		columns : [ {
	           "data" : "esti_ano" //견적신청번호
	        }, {
	           "data" : "ec_no" //카탈로그번호
	        }, {
	           "data" : "ec_name"//제품명
	        }, {
	           "data" : "esti_price"//가격
	        }, {
	           "data" : "outcome1"//1단계결재
	        }, {
	           "data" : "outcome2"//2단계결재
	        }, {
	           "data" : "note"//비고
	        } ],
	       columnDefs : [ {
	          targets : [ 0, 1, 2, 3, 4, 5, 6 ],
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
        	$('#btn_ask').transition('horizontal flip in')//신청버튼 흔들어줌
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
	
	//견적서 신청페이지(ajax)를 여는 스크립트
	function esti_ask(ac_no){
		$.ajax({
			method:"get",
			url:"./esti_submit.jsp?ac_no="+ac_no,
			success:function(page){
				$("#right_space").html(page);	
			},
			error:function(xhrObject) {
				alert(xhrObject.responseText);
			}
		});
	}
	
	//견적서신청페이지 열기 : 더블클릭 및 버튼클릭 
	$('#taable tbody').on('dblclick', 'tr', function() {
        var data = table.row(this).data();
		esti_ask(data["ec_no"]);
    });
	
	//견적신청 버튼 이벤트처리
	$('#btn_ask').on('click', function() {
		var target = null;
		$('.active.ro').each(function(index, element){
			target = $(this).children().eq(0).text();
            return;
            /* 
            td.each(function(i){//전체돌기
            tdArr.push(td.eq(i).text());
            }); */
         });
		esti_ask(target);
     });
	
	</script>
	<!-- 카탈로그용 DataTables스크립트 끝-->


	<!-- 견적서 일괄수정 모달창 띄우기 스크립트 시작 -->
	<script type="text/javascript">
		$("#btn_allUpd").on('click',function(){
			$('#modal_allUpd').modal('setting', 'closable', false).modal('show');
		});
	</script>
	<!-- 견적서 일괄수정 모달창 띄우기 스크립트 끝 -->

	<!-- 견적서 일괄수정 모달창 띄우기 시작 -->
	<form id="f_esmt">
	<div class="ui tiny modal" id="modal_allUpd">
		<div class="header">일괄수정하기</div>
		<div class="ui segment" style="margin-right: 20px; margin-left: 20px">
			<div class="ui form">
				<div class="field">
					<label>기준 가격</label>
					<input type="text" id="esti_price" placeholder="아래 비율을 적용할 기준단가를 입력해주세요.">
				</div>
			</div>
			
			<!-- 구분선 -->
			<div class="ui section divider"></div>
			
			<div class="ui form">
				<div class="two fields">
					<div class="field">
						<label>기준가격 이상 변동 비율</label>
						<input type="text" id="esti_ratio_up" placeholder="'%'를 빼고 입력홰주세요.">
					</div>
					<div class="field">
						<label>기준가격 미만 변동 비율</label>
						<input type="text" id="esti_ratio_dn" placeholder="'%'를 빼고 입력홰주세요.">
					</div>
				</div>
			</div>
		</div>
		
		<!-- 버튼/이벤트 시작 -->
		<div class="actions">
			<div id="div_allUpd" class="ui approve grey button">일괄수정하기</div>
    		<div class="ui cancel button">닫기</div>
		</div>
		<!-- 버튼/이벤트 끝 -->
		
	</div>
	</form>
	<script type="text/javascript">
		$("#div_allUpd").on('click',function(){
			$("#f_esmt").attr("method","post");
			$("#f_esmt").attr("action","./esti_result.jsp");  
			$("#f_esmt").submit();
			alert("신청되었습니다.");
		});
	</script>
	<!-- 견적서 일괄수정 모달창 띄우기 끝 -->


	<!--=============== 작성부분 ===============-->

</body>
</html>