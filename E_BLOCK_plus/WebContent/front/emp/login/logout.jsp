<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie cookie[] = request.getCookies();
String a = "";
if(cookie!=null){
 for(int i=0; i<cookie.length; i++){

   cookie[i].setMaxAge(0); //시간 0
   cookie[i].setPath("/");
   response.addCookie(cookie[i]);
 
 }
}
%>
<script type="text/javascript">
alert("로그아웃 되었습니다");
location.href="/E_BLOCK_plus/front/emp/login/login.jsp";
</script>
