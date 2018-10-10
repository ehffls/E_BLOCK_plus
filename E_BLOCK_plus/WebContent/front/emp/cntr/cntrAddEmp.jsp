<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 사원 등록</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
<body>


	<!--=============== 작성부분 ===============-->

	<%
		String targetName = "cntr_list";//여기에 request객체에 담은 리스트의 name을 쓰세요
		List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute(targetName);

		int e_no = 0; //사원번호    
		int d_no = 0; //부서번호    
		String e_id = ""; //아이디	   
		String e_pw = ""; //비밀번호	   
		String e_name = ""; //사원이름    
		String e_jdate = ""; //입사일자    
		int au_no = 0; //권한번호    
		String e_ph = ""; //사원연락처	
		String e_email = ""; //사원이메일	
		String note1 = ""; //사원비고    
		String e_addr = ""; //사원주소	   
		String e_bdate = ""; //생년월일	   
		String gender = ""; //성별 	   
		int e_rank = 0; //계약직급    

		String cntr_date = ""; //계약일자    
		String cntr_sort = ""; //계약분류    
		String cntr_sal = ""; //계약연봉    
		String cntr_sdate = ""; //계약시작일자   
		String cntr_fdate = ""; //계약종료일자   
		String note2 = ""; //계약비고    

		if (list != null && list.size() > 0) {
			e_no = Integer.parseInt(list.get(0).get("e_no").toString());
			e_name = list.get(0).get("e_name").toString();
			e_id = list.get(0).get("e_id").toString();
			e_pw = list.get(0).get("e_pw").toString();
			e_ph = list.get(0).get("e_ph").toString();
			e_email = list.get(0).get("e_email").toString();
			e_addr = list.get(0).get("e_addr").toString();
			e_bdate = list.get(0).get("e_bdate").toString();
			gender = list.get(0).get("gender").toString();
			d_no = Integer.parseInt(list.get(0).get("d_no").toString());
			e_jdate = list.get(0).get("e_jdate").toString();
			au_no = Integer.parseInt(list.get(0).get("au_no").toString());
			note1 = list.get(0).get("e_note").toString();
			cntr_date = list.get(0).get("cntr_date").toString();
			cntr_sort = list.get(0).get("cntr_sort").toString();
			cntr_sal = list.get(0).get("cntr_sal").toString();
			cntr_sdate = list.get(0).get("cntr_sdate").toString();
			cntr_fdate = list.get(0).get("cntr_fdate").toString();
			e_rank = Integer.parseInt(list.get(0).get("e_rank").toString());
			note2 = list.get(0).get("cntr_note").toString();
		}
	%>

	<div class="ui stacked segment" style="margin-bottom: 20px;">
		<div class="ui container">
			<form class="ui form" id="addForm">
				<h4 class="ui dividing header">개인 정보 등록</h4>
				<div class="two fields">
					<div class="field">
						<label>이름</label>
						<input type="text" name="e_name" placeholder="이름">
					</div>
					<div class="field">
						<label>생년월일</label>
						<div class="ui calendar" id="c_birthday">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" name="e_bdate" placeholder="생년월일" />
							</div>
						</div>
					</div>
				</div>
				<div class="three fields">
					<div class="field">
						<label>연락처</label>
						<input type="text" name="e_ph" placeholder="000-0000-0000( - 를 입력해주세요)">
					</div>
					<div class="field">
						<label>이메일</label>
						<input type="text" name="e_email" placeholder="abcd1234@gmail.com">
					</div>
					<div class="field">
						<label>성별</label>
						<div class="ui selection dropdown">
							<input type="hidden" name="gender">
							<i class="dropdown icon"></i>
							<div class="default text">성별</div>
							<div class="menu">
								<div class="item" data-value="1">
									<i class="male icon"></i> 남
								</div>
								<div class="item" data-value="0">
									<i class="female icon"></i> 여
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="field">
					<label>주소</label>
					<div class="fields">
						<div class="field">
							<div class="ui disabled input" style="width: 25%;">
								<input id="sample6_postcode" placeholder="우편번호">
							</div>
							<div class="ui grey button" onclick="execDaumPostcode()" >우편번호 찾기</div>
						</div>
					</div>
					<div class="field">
						<div class="ui input">
							<input id="sample6_address" name="e_addr" placeholder="주소">
						</div>
					</div>
				</div>
				<h4 class="ui dividing header">사원 정보 등록</h4>
				<div class="three fields">
					<div class="field">
						<label>입사일자</label>
						<div class="ui calendar" id="c_joinday">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" name="e_jdate" placeholder="입사일자" />
							</div>
						</div>
					</div>
					<div class="field">
						<label>아이디</label>
						<input type="text" name="e_id" placeholder="아이디">
					</div>
					<div class="field">
						<label>비밀번호</label>
						<input type="text" name="e_pw" placeholder="비밀번호">
					</div>
				</div>
				<div class="four fields">
					<div class="field">
						<label>사원번호</label>
						<input type="hidden" name="e_no" value="0">
						<div class="ui disabled input">
							<input type="text" placeholder="신규 등록일 경우 사원번호는 0입니다.">
						</div>
					</div>
					<div class="field">
						<label>부서번호</label>
						<input type="hidden" name="d_no" value="0">
						<div class="ui disabled input">
							<input type="text" placeholder="부서번호 미 배정시 0입니다">
						</div>
					</div>
					<div class="field">
						<label>직급</label>
						<input type="hidden" name="e_rank" value="0">
						<div class="ui disabled input">
							<input type="text" placeholder="신규 등록일 경우 직급는 0입니다.">
						</div>
					</div>
					<div class="field">
						<label>권한번호</label>
						<input type="hidden" name="au_no" value="0">
						<div class="ui disabled input">
							<input type="text" placeholder="신규 등록일 경우 권한번호는 0입니다.">
						</div>
					</div>
				</div>
				<div class="field">
					<label>비고</label>
					<input type="text" name="note1" placeholder="비고">
				</div>
				<h4 class="ui dividing header">사원 계약 등록</h4>
				<div class="three fields">
					<div class="field">
						<label>계약일자</label>
						<div class="ui calendar" id="c_day">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" name="cntr_date" placeholder="계약일자" />
							</div>
						</div>
					</div>
					<div class="field">
						<label>계약분류</label>
						<div class="ui selection dropdown">
							<input type="hidden" name="cntr_sort">
							<i class="dropdown icon"></i>
							<div class="default text">계약분류</div>
							<div class="menu">
								<div class="item" data-value="만료">만료</div>
								<div class="item" data-value="협상">협상</div>
								<div class="item" data-value="특채">특채</div>
								<div class="item" data-value="공채">공채</div>
							</div>
						</div>
					</div>
					<div class="field">
						<label>계약연봉</label>
						<input type="text" name="cntr_sal" placeholder="계약연봉">
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>계약시작일</label>
						<div class="ui calendar" id="c_start">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" name="cntr_sdate" placeholder="계약시작일" />
							</div>
						</div>
					</div>
					<div class="field">
						<label>계약종료일</label>
						<div class="ui calendar" id="c_end">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" name="cntr_fdate" placeholder="계약종료일" />
							</div>
						</div>
					</div>
				</div>
				<div class="field">
					<label>비고</label>
					<input type="text" name="note2" placeholder="비고">
				</div>
				<div align="center">
					<a href="javascript:cntrAddEmp()" class="ui button">등록</a>
				</div>
			</form>
		</div>
	</div>


	<script type="text/javascript">
		//성별
		$('.dropdown').dropdown();
	
		//캘린더 설정
		$(function() { //생년월일
			$('#c_birthday').calendar({
				type : 'date'
			});
		});
	
		$(function() { //입사일자
			$('#c_joinday').calendar({
				type : 'date'
			});
		});
	
		$(function() { //계약일
			$('#c_day').calendar({
				type : 'date'
			});
		});
	
		$(function() { //계약 시작일, 계약 종료일
			$('#c_start').calendar({
				type : 'date',
				endCalendar : $('#c_end')
			});
			$('#c_end').calendar({
				type : 'date',
				startCalendar : $('#c_start')
			});
		});
	
		
		<!-- Daum 우편번호 조회 시작  -->
		
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
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
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('sample6_address').value = fullAddr;
	
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('sample6_address').focus();
				}
			}).open();
		}
	</script>
	<!-- Daum 우편번호 조회 끝  -->

	<!--=============== 작성부분 ===============-->
</body>
</html>