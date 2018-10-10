<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//response.sendRedirect("/E_BLOCK_plus/front/emp/login/login.jsp");
	Cookie[] cookies = request.getCookies();
	String path = "./login.jsp";
	int aa = 10;
	for (Cookie cookie : cookies) {
		aa=cookie.getMaxAge();
		if (cookie.getName().equals("c_eno") || cookie.getName().equals("c_ename")|| cookie.getName().equals("c_auno")) {
			path = "/E_BLOCK_plus/front/main.jsp";
			break;
		}
	}
%>
<script>
alert(<%= aa %>);
	location.href = "<%=path%>";
</script>