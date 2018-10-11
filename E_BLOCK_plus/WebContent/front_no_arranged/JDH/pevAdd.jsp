<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사 평가 작성</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
</head>
<body>

	<!--=============== 작성부분 ===============-->

	<div class="ui mini modal" id="emp_modal">

		<div class="ui container">
			<form class="ui form" style="margin-top: 10px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px;">
				<h4 class="ui dividing header">인사 평가</h4>
				<div class="two fields">
					<div class="field">
						<label>평가사원이름</label>
						<div class="field">
							<div class="ui disabled input">
								<input name="e_no" placeholder="평가사원이름">
							</div>
						</div>
					</div>
					<div class="field">
						<label>평가점수</label>
						<div class="field">
							<div class="ui massive star rating" style="margin-top: 5px;"></div>
						</div>
					</div>
				</div>
				<div class="field">
					<label>인사평가작성</label>
					<textarea style="resize: none; height: 80%" name="ev_content"></textarea>
				</div>
				<div class="field" align="center">
					<div class="ui button" onclick="">저장</div>
					<div class="ui button" onclick="pev_bcencel()">취소</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$('.ui.modal').modal('show');

		$('.ui.rating').rating({
				initialRating : 0,
				maxRating : 5
			});
	
		function pev_bcencel() {
			$('.ui.modal').modal('hide');
		};
	</script>

	<!--=============== 작성부분 ===============-->

	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>