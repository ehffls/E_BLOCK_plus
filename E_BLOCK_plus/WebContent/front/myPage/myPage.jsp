<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int tablim = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script type="text/javascript">
	$(function(){
		//sidemenu처리 부분
		$('#sm_mp').attr("class","active item");
		$('#sm_mp_mp').attr("class","active item");
	});
</script>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->
<div class="ui container" style="margin-top:20px">
<h2 style="margin-top:20px">내 정보 페이지</h2>
</div>
<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>