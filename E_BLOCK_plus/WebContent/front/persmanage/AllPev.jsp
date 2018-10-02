<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사평가</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>




	<!--=============== 작성부분 ===============-->

	<!-- 전체 인사평가결과 페이지 -->
	<div class="ui container" style="margin-top: 5px;">
		<!-- 검색창 시작 -->
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="edit outline icon"></i>
					<div class="content">인사평가</div>
				</h2>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		//사이드 메뉴 설정
		$('#sm_persmanage').attr("class", "active item");
		$('#sm_persmanage_Eval').attr("class", "active item");
	</script>


	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>