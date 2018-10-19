<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//response.sendRedirect("/E_BLOCK_plus/front/emp/login/login.jsp");
	Cookie[] cookies = request.getCookies();
	String path = "./login.jsp";
	for (Cookie cookie : cookies) {
		String cName = cookie.getName(); 
		if (cName.equals("c_eno") || cName.equals("c_ename")|| cName.equals("c_auno")) {
			path = "/E_BLOCK_plus/emp/cmt/myList.jsp";
			break;
		}
	}
		
%>
<script>
	location.href = "<%=path%>";
</script>