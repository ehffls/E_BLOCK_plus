<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script type="text/javascript">
$(function(){
	$('#dd_3')
	  .dropdown({
		  onChange: function(value, text, $selectedItem) {
			  if(value==1 || value==3 || value==5 || value==7 || value==8 || value==10 || value==12){
					$('#dd_4')
					  .dropdown({
						    values: [
						    	<%
						    	for(int i=0;i<31;i++){
						    		if(i==31){ %>
						        {
						          name     : '<%=i+1+"일" %>',
						          value    : '<%=i+1 %>',
						        }
						    		
						    	<%		
						    		} else {
						    	%>
						    	
						    	{name: '<%=i+1+"일" %>',value: '<%=i+1 %>',selected: true},
						    	<% }} %>
						      ]
						    });			
					}
					else if(value==4 || value==6 || value==9 || value == 11){
						$('#dd_4')
						  .dropdown({
							    values: [
							    	<%
							    	for(int i=0;i<30;i++){
							    		if(i==30){ %>
							        {
							          name     : '<%=i+1+"일" %>',
							          value    : '<%=i+1 %>',
							        }
							    		
							    	<%		
							    		} else {
							    	%>
							    	
							    	{name: '<%=i+1+"일" %>',value: '<%=i+1 %>',selected: true},
							    	<% }} %>
							      ]
							    });	
					}
					else if(value==2){
						$('#dd_4')
						  .dropdown({
							    values: [
							    	<%
							    	for(int i=0;i<28;i++){
							    		if(i==28){ %>
							        {
							          name     : '<%=i+1+"일" %>',
							          value    : '<%=i+1 %>',
							        }
							    		
							    	<%		
							    		} else {
							    	%>
							    	
							    	{name: '<%=i+1+"일" %>',value: '<%=i+1 %>',selected: true},
							    	<% }} %>
							        
							      ]
							    });
					}
		    } 
	  });
});
function Ok(){
	$('#date').html("2018-09-18");
	$("#divx").html('<div class="large ui button" onClick="javascipt:btn_1()">Button</div>');
}
function cancel(){
	$("#divx").html('<div class="large ui button" onClick="javascipt:btn_1()">Button</div>');
}
</script>
</head>
<body>
<div class="fields">
    <div class="four wide field">
    	<input type="text" placeholder="년도" id="year">
    </div>
    <div class="four wide field">
        <select class="ui search dropdown" id="dd_3">
  <option value="">월</option>
<% int b=0;
for(int i=0;i<12;i++){ %>
  <option value="<%=i+1 %>" id="m<%=i+1 %>"><%=i+1 %>월</option>
  <%
	}
	%>
</select>
</div>
<div class="four wide field">
<select class="ui search dropdown" id="dd_4" style="width:30px">
  <option value="">일</option>
<% 
for(int i=0;i<b;i++){ %>
  <option value="<%=i+1 %>"><%=i+1 %>일</option>
  <%} %>
</select>
</div>
<div class="field">
<button class="ui button" onClick="javascript:Ok()">확인</button>
<button class="ui button" onClick="javascript:cancel()">취소</button>
  </div>
  </div>
</body>
</html>