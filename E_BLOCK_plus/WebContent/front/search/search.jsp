<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->

<!--=============== 검색부분 ===============-->
<div class="ui top attached tabular menu">
  <select class="ui dropdown">
  <option value="">사원/부서별</option>
  <option value="1">사원별</option>
  <option value="0">부서별</option>
</select>
  <div class="right menu">
    <div class="item">
      <div class="ui transparent icon input">
        <input type="text" placeholder="Search users...">
        <i class="search link icon"></i>
      </div>
    </div>
  </div>
</div>
<!--=============== 검색부분 ===============-->
<div class="ui bottom attached segment">
</div>


<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>