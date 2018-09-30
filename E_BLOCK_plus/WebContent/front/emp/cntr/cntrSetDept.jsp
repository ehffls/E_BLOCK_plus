
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 관리 페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>



	<!--=============== 작성부분 ===============-->

	<div class="ui container" style="margin-top: 5px;">
		<!-- 검색창 시작  -->
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="archive icon"></i>
					<div class="content">부서 관리</div>
				</h2>
			</div>
		</div>
		<div align="right">
			<div class="ui large button" onclick="ac_add()" style="margin-bottom: 5px;">수정하기</div>
		</div>
		<table id="taable" class="ui grey fixed single line celled table">
			<thead>
				<tr>
					<th>1</th>
					<th>2</th>
					<th>3</th>
					<th>4</th>
					<th>5</th>
					<th>6</th>
					<th>7</th>
					<th>8</th>
				</tr>
			</thead>
		</table>
	</div>
	
			<div class="ui mini modal" id="acc_add">
			<div class="header" align="center">부서 정보 수정</div>

			<div class="content">

				<div class="text">부서 번호</div>
				<div class="ui input" style="width: 100%"><input type="text"></div>
			<p>
				<div class="text">부서명</div>
				<div class="ui input" style="width: 100%"><input type="text"></div>
			<p>	
				<div class="text">연락처</div>
				<div class="ui input" style="width: 100%"><input type="text"></div>
			<p>	
				<!-- 주소검색  시작 -->
				<div class="text">주소</div>
				<div class="ui disabled input" style="width: 26%">
					<input id="sample6_postcode" placeholder="우편번호">
				</div>
				
				<input class="ui button" onclick="execDaumPostcode()" value="우편번호 찾기" 
					   style="width: 30%;padding-bottom: 13px; padding-top: 9px;"><br>
				
				<div class="ui disabled input" style="width: 100%; padding-top: 5px;">
					<input id="sample6_address" placeholder="주소">
				</div>
				<div class="ui input" style="width: 100%; padding-top: 5px;">
					<input id="sample6_address2" placeholder="상세주소">
				</div>
				<!-- 주소검색  끝 -->

				<div class="actions">
					<br>
					<div align="center">
					<div class="ui a button">등록</div>
					<div class="ui cancel button">취소</div>
					</div>
				</div>

			</div>
		</div>

	<script>
	//사이드 메뉴 설정
	$('#sm_persmanage').attr("class","active item");
	$('#sm_persmanage_dept').attr("class","active item");
	
	 function ac_add(){
		      $('#acc_add').modal('show')
		   }
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
			aLengthMenu : [10, 20, 30],
			language : {
/* 				  "info": "총 _PAGES_ 중 현재 _PAGE_페이지 입니다." */
				  "info": "",//테이블 하단에 나오는  Showing 1 to 10 of 100 entries 빈칸으로 지정
				  "infoEmpty": "",//검색 후 테이블 하단에 나오는  Showing 1 to 10 of 100 entries 빈칸으로 지정
				  "infoFiltered": "",//검색 후 테이블 하단에 나오는 (filtered from 100 total entries) 빈칸으로 지정
				  "emptyTable": "데이터가 없습니다",//테이블에 데이터가 없을 때 나오는 문구 지정
				  "zeroRecords": "검색 결과가 없습니다",//검색 결과 없을때 나오는 문구 지정	
				  "search": "검색 : ",
				  "lengthMenu": "_MENU_",//디폴트: "sLengthMenu": "Show _MENU_ entries",
 				  "paginate": {
						           "previous": "이전",
						           "next": "다음"
					          }//페이지 네이션 버튼 한글로 변경
			},
			ajax : {
				url : "./cntrSetDept_JSON.jsp",
				dataSrc : 'data'
			},
			columns : [
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				},
				{
					"data" : "band"
				}
			],
			columnDefs : [
				{
					targets : [0,1,2,3,4,5,6,7]
				   ,className : 'right aligned'
				}

			]
		});
		 
		$('#taable tr').attr("class", "center aligned");
		$('#taable th').attr("class", "center aligned");
	
		$('#taable tbody').on('click', 'tr', function() {
			var data = table.row(this).data();
			alert(data["band"]);
	
			if ($(this).hasClass('active')) {
				$(this).removeClass('active');
			} else {
				table.$('tr.active').removeClass('active');
				$(this).addClass('active');
			}
		});
	</script>
	
<!-- Daum 우편번호 조회 시작  -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
<!-- Daum 우편번호 조회 끝  -->


	
	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>