<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%
	//response.sendRedirect("/E_BLOCK_plus/front/emp/login/login.jsp");
	Cookie[] cookies = request.getCookies();
	String isnotok = "";
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("c_eno") || cookie.getName().equals("c_ename")
					|| cookie.getName().equals("c_auno")) {
				isnotok = "ok";
				break;
			}
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
<title>E_BLOCK_LOGIN</title>

<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>

<style type="text/css">
body {
	background-image:url(/E_BLOCK_plus/1_file/img/_common/login_company.jpg);
	background-size: cover;
	background-position: center;
}

body>.grid {
	height: 100%;
}

.image {
	margin-top: -100px;
}

.column {
	max-width: 450px;
}
.ui.grey.message {
  background-color: #D5D5D5;
   color: #FFFFFF;
}
</style>
<script>
  if("ok"=="<%=isnotok%>"){
	  location.href="/E_BLOCK_plus/emp/cmt/myList.jsp";
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
			<h3 class="ui teal image header">
				<img src="/E_BLOCK_plus/1_file/img/_common/logo_white_font.png" style="margin-bottom: 0px;width: 350px;height: 70px;margin-left: 8px;margin-top: 0px;"><br>
			</h3>
			<form id="f_login" method="post" class="ui large form" action="/E_BLOCK_plus/emp/login/check">
				<div class="ui stacked segment">
					<div class="field">
						<div class="ui left icon input">
							<i class="user icon"></i> <input id="e_id" type="text" name="e_id" placeholder="아이디">
						</div>
					</div>
					<div class="field">
						<div class="ui left icon input">
							<i class="lock icon"></i> <input id="e_pw" type="password" name="e_pw" placeholder="비밀 번호"  onKeypress="javascript:if(event.keyCode==13) {$('#f_login').submit();}"></input>
						</div>
					</div>
					<div class="ui fluid large teal submit button">Login</div>
				</div>

				<div class="ui error message"></div>

			</form>

			<div class="ui grey message">관리자 문의 010-1234-5678</div>
		</div>
	</div>
	<script type="text/javascript">
		$(".ui.submit.button").click(function() {
			$("#f_login").submit();
		});
	</script>
</body>

</html>
