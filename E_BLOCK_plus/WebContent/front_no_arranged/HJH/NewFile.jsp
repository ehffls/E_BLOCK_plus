<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<title>Insert title here</title>
</head>
<body>
 
  <p>Click and drag the mouse to select text in the inputs.</p>
  <input type="text" value="Some text">
  <input type="text" value="to test on">
  <div></div>
 
<script type="text/javascript">
$( ":input" ).select(["text"]function() {
  alert("a");
});
</script>
 
</body>
</html>