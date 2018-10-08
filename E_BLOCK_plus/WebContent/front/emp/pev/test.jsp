<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String Project_Root3 = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사평가작성</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script type="text/javascript">
	function j_ok() {
		
	}
	function j_cancle() {
		
	}
</script>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>




	<!--=============== 작성부분 ===============-->

	<div class="ui container" style="margin-top: 10px">
		<h2 style="margin-top: 20px">인사평가작성</h2>
	</div>
	<div id="form_1">
		<div class="ui container" style="margin-top: 20px">
			<form class="ui form">
				<div class="two fields">
					<div class="field">
						<div class="ui labeled input">
							<a class="ui label">평가대상번호</a> <input type="text">
						</div>
					</div>
					<div class="field">
						<div class="ui indicating progress" data-value="10"
							data-total="20" id="percent">
							<div class="bar">
								<div class="progress"></div>
							</div>
							<div class="label">평가점수</div>
							<div class="ui button" id="b_minus">마이너스</div>
							<div class="ui button" id="b_plus">플러스</div>
						</div>
					</div>
				</div>
				<div class="field" style="height: 300px">
					<label>인사평가작성</label>
					<textarea style="resize: none; height: 80%"></textarea>
				</div>
				<div class="field">
					<div class="ui submit button" onclick="j_ok()">저장</div>
					<div class="ui submit button" onclick="j_cancle()">취소</div>
				</div>
			</form>
		</div>
	</div>

	<!--=============== 작성부분 ===============-->
	<script type="text/javascript">
		$('#percent').progress();
		$("#b_minus").on("click", function() {
			$('#percent').progress('decrement');

		});
		$("#b_plus").on("click", function() {
			$('#percent').progress('increment');

		});
	</script>


	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>