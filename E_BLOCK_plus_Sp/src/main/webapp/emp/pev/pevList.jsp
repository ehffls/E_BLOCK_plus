<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사 평가 결과</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>


	<!--=============== 작성부분 ===============-->
	<script type="text/javascript">
		//사이드 메뉴 설정
		$('#sm_emp').attr("class", "active item");
		$('#sm_emp_pev').attr("class", "active item");
	</script>

	<div class="ui container" style="margin-top: 5px;">
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="id card outline icon"></i>
					<div class="content">인사 평가 결과</div>
				</h2>
			</div>
		</div>

		<div class="ui segment">
			<div class="ui grid">
				<div class="row" style="padding-bottom: 5px; padding-top: 10px;">
					<div class="eight wide column"></div>
					<div class="one wide column"></div>
					<div class="three wide column">
						<div class="ui calendar" id="r_start" align="right" style="margin-bottom: 5px;">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" placeholder="시작일자" />
							</div>
						</div>
					</div>
					<div class="four wide column ">
						<div class="ui calendar" id="r_end" align="right" style="margin-bottom: 5px;">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input id="r_end" type="text" placeholder="종료일자">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>

		<!--=============== 작성부분 ===============-->

		<%@ include file="/front/_includePage/sticky"%>
</body>
</html>