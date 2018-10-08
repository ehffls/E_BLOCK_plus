<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.lang.NullPointerException"%>
<%
	Map<String,Object> result = null;
String e_name ;
String e_no;
String au_no;
String isnotok= null;
 result = (Map<String,Object>)request.getAttribute("login");
if (result != null) {
	isnotok ="a";
		if (result.get("res_msg") != null) {
			isnotok = (String) result.get("res_msg");
		} else {
			e_name = (String) result.get("e_name");
			e_no = String.valueOf(result.get("e_no"));
			au_no = String.valueOf(result.get("au_no"));
			Cookie c_ename = new Cookie("c_ename", e_name);
			Cookie c_eno = new Cookie("c_eno", e_no);
			Cookie c_auno = new Cookie("c_auno", au_no);
			c_ename.setPath("/");
			c_eno.setPath("/");
			c_auno.setPath("/");
			response.addCookie(c_ename);
			response.addCookie(c_eno);
			response.addCookie(c_auno);
			isnotok = "ok";
/* 			RequestDispatcher requestDispatcher=request.getRequestDispatcher("/front/main.jsp");
			requestDispatcher.forward(request, response); */ 
			 /* response.sendRedirect(); */ 
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
  <!-- Standard Meta -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

  <!-- Site Properties -->
  <title>Login Example - Semantic</title>

  <%@ include file="/0_src/_includeList/commonUI_S.jsp" %>

  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .image {
      margin-top: -100px;
    }
    .column {
      max-width: 450px;
    }
  </style>
  <script>
  if("ok"=="<%=isnotok%>"){
	  location.href="/E_BLOCK_plus/front/main.jsp";
  }
  $(document)
    .ready(function() {
    	<%-- alert('<%=isnotok%>'); --%>
    });
  
  </script>
</head>
<body>	

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
      <img src="/E_BLOCK_plus/1_file/img/_common/logo_white_font.png" style="margin-bottom:20px; width: 250px; height:60px"><br>
    </h2>
    <form id="f_login" method="post" class="ui large form" action="/E_BLOCK_plus/emp/login/check.ebp">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input id="e_id" type="text" name="e_id" placeholder="아이디">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input id="e_pw" type="password" name="e_pw" placeholder="비밀 번호">
          </div>
        </div>
        <div class="ui fluid large teal submit button">Login</div>
      </div>

      <div class="ui error message"></div>

    </form>

    <div class="ui message">
     관리자 문의 010-1234-5678
    </div>
  </div>
</div>
<script type="text/javascript">
$(".ui.submit.button").click(function(){
	$("#f_login").submit();
});
</script>
</body>

</html>
