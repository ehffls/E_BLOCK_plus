<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int tablim = 5;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내게온결재목록</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script type="text/javascript">
	$(function(){
		//sidemenu처리 부분
		$('#approval').attr("class","active item");
		$('#sm_ap').attr("class","active item");
		$('#sm_ap_tome').attr("class","active item");
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
<h2 style="margin-top:20px">내게 온 결재목록</h2>
<table class="grey ui selectable celled table">
  <thead>
    <tr>
      <th>발신자</th>
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