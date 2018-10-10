<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script type="text/javascript"></script>
</head>
<body>

<div class="ui indicating progress" id="example5" data-value="1" data-total="20">
  <div class="bar"></div>
  <div class="label">Adding Photos</div>
</div>
<button id="bbb" onclick="">bbb</button>
<button id="aaa">aaa</button>
<script type="text/javascript">
$('#example5')
  .progress('increment')
;
$("#aaa").on("click",function(){
	$('#example5')
	  .progress('increment')
	;	
});
$("#bbb").on("click",function(){
	$('#example5')
	  .progress('decrement')
	;
});
</script>

</body>
</html>