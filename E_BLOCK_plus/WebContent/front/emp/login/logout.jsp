<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Cookie cookie[] = request.getCookies();
if(cookie!=null){
 for(int i=0; i<cookie.length; i++){
  if(cookie[i].getName().equals("c_ename")){
   cookie[i].setMaxAge(0); //시간 0
   response.addCookie(cookie[i]);
  }
  else if(cookie[i].getName().equals("c_eno")){
	   cookie[i].setMaxAge(0); //시간 0
	   response.addCookie(cookie[i]);
	  }
  else if(cookie[i].getName().equals("c_auno")){
	   cookie[i].setMaxAge(0); //시간 0
	   response.addCookie(cookie[i]);
	  }
 }
}
%>
<script type="text/javascript">
alert("로그아웃 되었습니다");
location.href="/E_BLOCK_plus/front/emp/login/login.jsp";
</script>