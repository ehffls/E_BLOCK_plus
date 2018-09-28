<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고신청</title>
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
	 $('#j_modal')
	  .modal('show'); 
});
</script>  --%>
<!--=============== 스크립트 영역 끝 ===============-->
<!--=============== 스크립트 영역 시작 ===============-->
<script type="text/javascript">
<!-----작성승인----->	
	function j_ok(){
		alert("처리되었습니다.");
	}
<!-----작성취소 처리중----->
	function j_cancle(){
		location.href = "./jaegoEmp.jsp"; 
	}
</script>
<!--=============== 스크립트 영역 끝 ===============-->


<!--=============== 작성부분 ===============-->

<div id="j_modal" class="ui modal">  


<div class="ui form" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-783" data-genuitec-path="/E_BLOCK_plus/WebContent/front_no_arranged/HGS/insaWrite.jsp" style="width: 650px;margin-left: 200px;margin-top: 15px;margin-bottom: 15px;">
		<div class="field" style="width: 200px;">
			<label>주문번호</label><input placeholder="0000" type="text" style="width: 230px;">
		<select class="ui compact selection dropdown" style="margin-bottom: 10px;height: 42px;width: 245.4px;margin-top: 10px;">
				<option value="all">전체품목</option>
				<option selected="" value="품목0">품목0</option>
				<option value="품목1">품목1</option>
				<option value="품목2">품목2</option>
				<option value="품목3">품목3</option>
			</select>
		</div>	
		<div class="field" style="width: 200px;">
			<label>부서</label> <select class="ui fluid dropdown">
				<option value="인사">인사부</option>
				<option value="총무">총무부</option>
				<option value="기획">기획부</option>
				<option value="감사">감사부</option>
			</select>
		</div>
		<div class="field" style="margin-bottom: 10px;width: 300px;">
			<label>품목명</label> <input placeholder="품목명" type="text" style="height: 36px;width: 330px;">
		</div>
		<div class="field" style="margin-bottom: 10px;width: 200px;">
			<label>단가</label>&nbsp;&nbsp;&nbsp;&nbsp; <input placeholder="000" type="text" style="height: 42px;">
		</div>
		<div class="field" style="margin-bottom: 20px;width: 200px;">
			<label>재고량</label> <input placeholder="000" type="text" style="height: 42px;">
		</div>


		<div class="inline field" style="margin-bottom: 20px;">
			<div class="ui checkbox">
				<input type="checkbox" tabindex="0" class="hidden"> <label>결제 책임 동의</label>
			</div>
		</div>
		<div class="ui submit button" onclick="j_ok()">결재</div>
		<div class="ui submit button" onclick="j_cancle()">취소</div>
		</div>
</div> 

	<!--=============== 작성부분 ===============-->



<%-- <%@ include file="/front/_includePage/sticky" %>
</body>
</html>  --%>