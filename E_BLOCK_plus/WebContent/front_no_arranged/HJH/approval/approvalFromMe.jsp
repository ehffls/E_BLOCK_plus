<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int tablim = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내결재신청목록</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->
<div class="ui container" style="margin-top:20px">
<table class="grey ui selectable celled table">
  <thead>
    <tr>
      <th>수신자</th>
      <th>제목</th>
      <th>날짜</th>
      <th>상태</th>
      <th></th>
    </tr>
  </thead>
  <tbody>
<%
	for(int i=0;i<tablim;i++){
%>
    <tr>
      <td><%=i %></td>
      <td><%=i %></td>
      <td><%=i %></td>
      <td><%=i %></td>
      <td style="width:125px"><button class="ui fluid secondary basic button">상세보기</button></td>
    </tr>
<%
	}
%>
  </tbody>
</table>
</div>
<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>