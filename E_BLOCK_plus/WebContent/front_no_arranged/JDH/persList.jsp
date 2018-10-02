<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원정보목록</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>




	<!--=============== 작성부분 ===============-->

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

	<!-- 권한부여 페이지 -->
	<div class="ui container" style="margin-top: 5px;">
		<!-- 검색창 시작 -->
		<div class="ui two column stackable grid container">
			<div class="column" align="left" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="address book outline icon"></i>
					<div class="content">전체 사원 정보 목록</div>
				</h2>
			</div>
			<div class="column" align="right" style="padding-right: 0px;">
				<div class="ui left action right icon input">
					<!-- dropdown 시작 -->
					<div class="ui basic floating dropdown button">
						<div div class="default text">이름</div>
						<i class="dropdown icon"></i>
						<div class="menu" style="top: 31px;">
							<div class="item" data-value="name">이름</div>
							<div class="item" data-value="dname">직책</div>
							<div class="item" data-value="num">부서번호</div>
							<div class="item" data-value="addr">나이</div>
						</div>
					</div>
					<!-- dropdown 끝 -->
					<i class="search icon"></i> <input type="text" placeholder="검색" />
				</div>
			</div>
		</div>
		<!-- 검색창 끝 -->

		<!--  -->
		<table class="ui fixed single line celled table"
			style="margin-top: 5px;">
			<thead>
				<tr class="center aligned">
					<th>부서번호</th>
					<th>부서명</th>
					<th>이름</th>
					<th>직책</th>
					<th>나이</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<tr class="center aligned">
					<td>444</td>
					<td>멍멍이부</td>
					<td>멍멍이</td>
					<td>사원</td>
					<td>30</td>
					<td>멍멍시 멍멍구 멍멍동</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="6">
						<div class="ui right floated pagination menu">
							<a class="icon item"> <i class="left chevron icon"></i>
							</a> <a class="item">1</a> <a class="item">2</a> <a class="item">3</a>
							<a class="item">4</a> <a class="icon item"> <i
								class="right chevron icon"></i>
							</a>
						</div>
						<div align="right">
							<div class="ui large button" onclick="" style="margin-top: 1px;">사원추가</div>
							<div class="ui large button" onclick="ac_add()"
								style="margin-top: 1px;">수정하기</div>
						</div>
					</th>
				</tr>
			</tfoot>
		</table>

		<div class="ui mini modal" id="acc_add">
			<div class="header" align="center">사원 정보 수정</div>

			<div class="content">

				<div class="text">부서 번호</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<p>
				<div class="text">부서명</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<p>
				<div class="text">이름</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<p>
				<div class="text">직책</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<p>
				<div class="text">나이</div>
				<div class="ui input" style="width: 100%">
					<input type="text">
				</div>
				<p>
					<!-- 주소검색  시작 -->
				<div class="text">주소</div>
				<div class="ui disabled input" style="width: 26%">
					<input id="sample6_postcode" placeholder="우편번호">
				</div>

				<input class="ui button" onclick="execDaumPostcode()"
					value="우편번호 찾기"
					style="width: 30%; padding-bottom: 13px; padding-top: 9px;"><br>

				<div class="ui disabled input"
					style="width: 100%; padding-top: 5px;">
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

	</div>

	<script type="text/javascript">
   function ac_add(){
      $('#acc_add').modal('show')
   }
	$(document).ready(function(){
		$('.ui.dropdown').dropdown();
	});	
</script>



	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>