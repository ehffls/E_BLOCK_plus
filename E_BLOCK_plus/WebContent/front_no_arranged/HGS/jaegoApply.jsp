<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->
	<div class="ui inverted segment" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-779" data-genuitec-path="/E_BLOCK_plus/WebContent/front_no_arranged/HGS/jaegoApply.jsp" style="width: 628px; height: 408px;">
		<div class="ui inverted form">
			<div class="field">
				<label>주문번호</label> <input placeholder="0000" type="text" style="width: 230px;">
			</div>
			<select class="ui compact selection dropdown" style="margin-bottom: 10px; height: 42px; width: 245.4px;">
				<option value="all">전체품목</option>
				<option selected="" value="품목0">품목0</option>
				<option value="품목1">품목1</option>
				<option value="품목2">품목2</option>
				<option value="품목3">품목3</option>
			</select>
		</div>
		<div class="field" style="margin-bottom: 10px;">
			<label>품목명</label> <input placeholder="품목명" type="text" style="height: 36px; width: 404px;">
		</div>
		<div class="field" style="margin-bottom: 10px;">
			<label>단가</label>&nbsp&nbsp&nbsp&nbsp <input placeholder="000" type="text" style="height: 42px;">
		</div>
		<div class="field" style="margin-bottom: 20px;">
			<label>재고량</label> <input placeholder="000" type="text" style="height: 42px;">
		</div>


		<div class="inline field" style="margin-bottom: 20px;">
			<div class="ui checkbox">
				<input type="checkbox" tabindex="0" class="hidden"> <label>결제 책임 동의</label>
			</div>
		</div>
		<div class="ui submit button">결재</div>
		<div class="ui submit button">취소</div>
	</div>
	<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>