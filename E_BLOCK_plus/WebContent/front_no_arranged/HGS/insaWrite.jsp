<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사평가 작성페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>

<!--=============== 스크립트 영역 시작 ===============-->
<script type="text/javascript">

$(document).ready(function(){	
	 $('#i_modal')
	  .modal('show'); 
});
</script>
<!--=============== 스크립트 영역 끝 ===============-->


<!--=============== 작성부분 ===============-->

 <div id="i_modal" class="ui modal"> 

	<div class="ui form" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-783" data-genuitec-path="/E_BLOCK_plus/WebContent/front_no_arranged/HGS/insaWrite.jsp" style="width: 650px;margin-left: 200px;margin-top: 15px;margin-bottom: 15px;">
		<div class="field" style="width: 200px;">
			<label style="">사원이름</label> <input type="text" name="shipping[first-name]" placeholder="First Name">
		</div>
		<div class="field" style="width: 200px;">
			<label>부서</label> <select class="ui fluid dropdown">
				<option value="인사">인사부</option>
				<option value="총무">총무부</option>
				<option value="기획">기획부</option>
				<option value="감사">감사부</option>
			</select>
		</div>
		<div class="field">
			<label>인사평가 작성</label>
			<textarea></textarea>
		</div>
		<div class="ui submit button">작성</div>
		<div class="ui submit button">수정</div>
		<div class="ui submit button">취소</div>
	</div>

 </div>

	<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>