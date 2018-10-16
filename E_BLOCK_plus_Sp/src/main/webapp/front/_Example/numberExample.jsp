<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/E_BLOCK_plus/0_src/js/jquery/jquery-1.12.0.js"></script>
<script src="/E_BLOCK_plus/0_src/js/jquery/jquery.number.js"></script>
</head>
<body>

<input type="text" id="numb">
<button id="aa">버튼</button>
<script>
$("#numb").number(true);
$("#aa").click(function(){
	var a=$("#numb").val();
	alert(a);
});
</script>
</body>
</html>