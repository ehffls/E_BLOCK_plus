<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List" %>
<%
	List<Map<String,Object>> pList = (List<Map<String,Object>>)request.getAttribute("rList");
	Map<String,Object> pMap = pList.get(0);
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
<div class="ui top attached segment"><h2><%=pMap.get("e_name")+" "+pMap.get("e_rank") %></h2></div>

<div class="ui bottom attached segment">
<div class="ui four cards">
  <div class="card">
    <div class="extra content">
      아이디
    </div>
    <div class="content">
      <%=pMap.get("e_id") %>
    </div>
  </div>
  <div class="card">
    <div class="extra content">
      전화번호
    </div>
    <div class="content">
      <%=pMap.get("e_ph") %>
    </div>
  </div>
  <div class="card">
    <div class="extra content">
      성별
    </div>
    <div class="content">
      <%=pMap.get("gender") %>
    </div>
  </div>
  <div class="card">
    <div class="extra content">
      이메일
    </div>
    <div class="content">
      <%=pMap.get("e_mail") %>
    </div>
  </div>
  </div>
<div class="ui four cards">
  <div class="card">
    <div class="extra content">
      생년월일
    </div>
    <div class="content">
      <%=pMap.get("e_bdate") %>
    </div>
  </div>
  <div class="card">
    <div class="extra content">
      입사일자
    </div>
    <div class="content">
      <%=pMap.get("e_jdate") %>
    </div>
  </div>
  <div class="card">
    <div class="extra content">
      부서명
    </div>
    <div class="content">
      <%=pMap.get("d_name") %>
    </div>
  </div>
  <div class="card">
    <div class="extra content">
      내선번호
    </div>
    <div class="content">
      <%=pMap.get("d_ph") %>
    </div>
  </div>
  </div>
</div>
</div>
<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>