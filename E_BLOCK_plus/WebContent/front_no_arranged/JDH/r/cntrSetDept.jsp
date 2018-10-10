<%@page import="java.util. * " %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부서 배정 & 수정</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
</head>
<body>



	<!--=============== 작성부분 ===============-->


	<div class="ui small modal" id="dept_modal">
		<div class="ui container">
			<form class="ui form" style="margin-top: 10px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px;">
				<h4 class="ui dividing header">부서 배정 & 수정</h4>
				<div class="two fields">
					<div class="field">
						<label>이름</label>
						<div class="ui disabled input">
							<input type="text" placeholder="이름">
						</div>
					</div>
					<div class="field">
						<label>사원 번호</label>
						<div class="ui disabled input">
							<input type="text" placeholder="사원 번호">
						</div>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>부서명</label>
						<input type="text" placeholder="부서명">
					</div>
					<div class="field">
						<label>권한 번호</label>
						<input type="text" placeholder="권한 번호">
					</div>
				</div>
				<div class="field">
					<label>비고</label>
					<input type="text" placeholder="비고">
				</div>
				<div align="center">
					<div class="ui button">등록</div>
					<div class="ui button" onclick="b_cencel()">취소</div>
				</div>
			</form>
		</div>
	</div>


	<script type="text/javascript">
	
		function b_cencel() {
			$('.ui.modal').modal('hide');
		};
	
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