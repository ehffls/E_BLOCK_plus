<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.datebox-calendar-inner {
  height: 250px;
}
.datebox-button {
  padding: 4px 0;
  text-align: center;
}
.datebox-button a {
  line-height: 22px;
  font-size: 14px;
  font-weight: bold;
  text-decoration: none;
  opacity: 0.6;
  filter: alpha(opacity=60);
}
.datebox-button a:hover {
  opacity: 1.0;
  filter: alpha(opacity=100);
}
.datebox-current,
.datebox-close {
  float: left;
}
.datebox-close {
  float: right;
}
.datebox .combo-arrow {
  background-image: url('images/datebox_arrow.png');
  background-position: center center;
}
.datebox-button {
  background-color: #F4F4F4;
}
.datebox-button a {
  color: #444;
}
body {
    font-family:verdana,helvetica,arial,sans-serif;
    padding:20px;
    font-size:12px;
    margin:0;
}
h2 {
    font-size:18px;
    font-weight:bold;
    margin:0;
    margin-bottom:15px;
}
.demo-info{
	padding:0 0 12px 0;
}
.demo-tip{
	display:none;
}
.label-top{
    display: block;
    height: 22px;
    line-height: 22px;
    vertical-align: middle;
}
</style>
<meta charset="UTF-8">
<title>전자결재 페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script src="<%=Project_Root %>/0_src/js/easyui/jquery.easyui.min.js"></script>
	<%-- <link rel="stylesheet" type="text/css" href="<%=Project_Root %>/0_src/css/easyui/themes/default/easyui.css"> --%>
	<link rel="stylesheet" type="text/css" href="<%=Project_Root %>/0_src/css/easyui/themes/icon.css?1">
	<%-- <link rel="stylesheet" type="text/css" href="<%=Project_Root %>/0_src/css/easyui/demo/demo.css"> --%>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>
<script type="text/javascript">
	$(function(){
		
	});
	function btn_1(){
		$.ajax({
			method:"get"
		   ,url:"approvalAjax.jsp"
		   ,success:function(result){
			   $("#divx").html(result);
			}
		   ,error:function(xhrObject){
				alert(xhrObject.responseText);
			}
		});
	}
	function ac_add(){
		$('#acc_add').modal('show')
	}
</script>



<!--=============== 작성부분 ===============-->
<div class="ui container" style="margin-top:20px">
<div class="ui compact menu">
  <div class="ui simple dropdown item">
    결재종류
    <i class="dropdown icon"></i>
    <div class="menu">
      <div class="active item">근태관련</div>
      <div class="item">비품관련</div>
      <div class="item">사직관련</div>
    </div>
  </div>
</div>
</div>
<div class="ui container" style="margin-top:20px">
<form class="ui form">
  <h4 class="ui dividing header">근태관련 결재서</h4>
  <div class="two fields">
    <div class="field">
        <div class="ui labeled input">
      <a class="ui label">신청사원</a>
      <input type="text" placeholder="Placeholder...">
      </div>
      </div>
      <div class="field">
      <div class="ui labeled input">
      <a class="ui label">결재사원</a>
      <input type="text" placeholder="Placeholder...">
    </div>
    </div>
    </div>
    <label>신청일자</label>
  <div class="two fields">
  <div class="field">
            <input class="easyui-datebox" style="width:100%;">
    </div>
    <div id="divx" style="margin-top:10px">
    <div class="twofield">
    <div class="large ui button" onClick="javascipt:ac_add()">Button</div>
    </div>  
    </div>
  </div>
  <div class="ui button" tabindex="0">저장</div>
  <div class="ui button" tabindex="0">취소</div>
</form>

</div>

<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>
