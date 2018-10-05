<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계약 변경</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
</head>
<body>



	<!--=============== 작성부분 ===============-->

	<div class="ui small modal">
		<div class="ui container">
			<form class="ui form" style="margin-top: 10px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px;">
				<h4 class="ui dividing header">사원 계약 변경</h4>
				<div class="two fields">
					<div class="field">
						<label>이름</label>
						<div class="field">
							<div class="ui disabled input">
								<input id="" placeholder="이름">
							</div>
						</div>
					</div>
					<div class="field">
						<label>사원 번호</label>
						<div class="field">
							<div class="ui disabled input">
								<input id="" placeholder="사원번호">
							</div>
						</div>
					</div>
				</div>
				<div class="three fields">
					<div class="field">
						<label>계약일자</label>
						<div class="ui calendar" id="c_day">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" placeholder="계약일자" />
							</div>
						</div>
					</div>
					<div class="field">
						<label>계약분류</label>
						<input type="text" placeholder="계약분류">
					</div>
					<div class="field">
						<label>계약연봉</label>
						<input type="text" placeholder="계약연봉">
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>계약시작일</label>
						<div class="ui calendar" id="c_start">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" placeholder="계약시작일" />
							</div>
						</div>
					</div>
					<div class="field">
						<label>계약종료일</label>
						<div class="ui calendar" id="c_end">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" placeholder="계약종료일" />
							</div>
						</div>
					</div>
				</div>
				<div class="field">
					<label>비고</label>
					<input type="text" placeholder="비고">
				</div>
				<div align="center">
					<div class="ui button">등록</div>
					<div class="ui cancel button">취소</div>
				</div>
			</form>
		</div>
	</div>


	<script type="text/javascript">
	
		$('.ui.modal')
			.modal('show')
		;
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
	</script>

	<!--=============== 작성부분 ===============-->



</body>
</html>