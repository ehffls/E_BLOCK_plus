<%-- <%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.lang.NullPointerException"%>
<%
/*"d_no"
"d_name"
"e_no"
"e_name"
"e_rank"
"au_no"  */
Map<String,Object> result = null;
String e_name ;
String e_no;
String au_no;
String isnotok= null;
try{
 result = (Map<String,Object>)request.getAttribute("login");
if(result.size()<=2){
	e_name=(String)result.get("e_name");
	e_no=(String)result.get("e_no");
	au_no=(String)result.get("au_no");
	Cookie c_ename = new Cookie("c_ename",e_name);
	Cookie c_eno = new Cookie("c_eno",e_no);
	Cookie c_auno = new Cookie("c_auno",au_no);
	response.addCookie(c_ename);
	response.addCookie(c_eno);
	response.addCookie(c_auno);
}else{
	
	isnotok =(String)result.get("res_msg");
}}
catch(NullPointerException ne){
	
}
%>
<!DOCTYPE html>
<html>
<head> 
  <!-- Standard Meta -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
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
    .column {W
      max-width: 450px;
    }
  </style>
  <script>
  
  
  $(document)
    .ready(function() {
    if(<%=isnotok%>!=null){
    	alert("아이디나 비번이 틀렸습니다");
    }
      $('.ui.form')
        .form({
          fields: {
            email: {
              identifier  : 'email',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your e-mail'
                },
                {
                  type   : 'email',
                  prompt : 'Please enter a valid e-mail'
                }
              ]
            },
            password: {
              identifier  : 'password',
              rules: [
                {
                  type   : 'empty',
                  prompt : 'Please enter your password'
                },
                {
                  type   : 'length[6]',
                  prompt : 'Your password must be at least 6 characters'
                }
              ]
            }
          }
        })
      ;
    })
  ;
  </script>
</head>
<body>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <h2 class="ui teal image header">
      <img src="/E_BLOCK_plus/1_file/img/_common/logo_white_font.png" style="margin-bottom:20px; width: 250px; height:60px"><br>
      
    </h2>
    <form id="login" name="login" class="ui large form" action="/emp/login/check.ebp">
      <div class="ui stacked segment">
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input id="email" name="email" type="text" placeholder="사원 번호">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input id="password" name="password" type="password" placeholder="비밀 번호">
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




</body>
</html> --%>