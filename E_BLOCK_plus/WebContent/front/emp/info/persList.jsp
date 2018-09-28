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
$(document).ready(function() {	
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
<div class="ui top attached segment">홍길동 사원</div>
<div class="ui attached three item menu">
    <a class="item">Item</a>
    <a class="item">Item</a>
    <a class="item">Item</a>
  </div>
<div class="ui attached segment">
    1
  </div>
  <div class="ui attached icon info message">
    <i class="help circle icon"></i>
    <div class="content">
      Message
    </div>
  </div>
  <table class="ui attached celled table">
    <thead>
      <tr><th>직급</th>
      <th>부서</th>
      <th>주소</th>
    </tr></thead>
    <tbody>
      <tr>
        <td>Cell</td>
        <td>Cell</td>
        <td>Cell</td>
      </tr>
    </tbody>
  </table>
  <div class="ui attached segment">
    1
  </div>
  <table class="ui bottom attached celled table">
  
    <thead>
      <tr><th>Header</th>
      <th>Header</th>
      <th>Header</th>
    </tr></thead>
    <tbody>
      <tr>
        <td>Cell</td>
        <td>Cell</td>
        <td>Cell</td>
      </tr>
    </tbody>
  </table>
</div>
<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>