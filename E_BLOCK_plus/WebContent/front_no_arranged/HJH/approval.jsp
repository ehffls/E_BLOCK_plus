<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>
<script type="text/javascript">
	$(function(){
		$('#dd_1')
		  .dropdown({
				  action : function(text, value, element){
					  aaa();
				  }
				  });
	});
	function aaa(){		
		$('#dd_2')
		  .dropdown({
			    values: [
			        {
			          name: 'Male',
			          value: 'male'
			        },
			        {
			          name     : 'Female',
			          value    : 'female',
			          selected : true
			        }
			      ]
			    });
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
    <div class="three fields">
    <div class="field">
    	<input type="text" placeholder="년도">
    </div>
    <div class="field">
        <select class="ui search dropdown" id="dd_1">
  <option value="">월</option>
<% int a=0;
for(int i=0;i<12;i++){ %>
  <option value="<%=i+1 %>" id="m<%=i+1 %>"><%=i+1 %>월</option>
  <%
	}
	%>
</select>
</div>
<div class="field">
<select class="ui search dropdown" id="dd_2">
  <option value="">일</option>
<% 
for(int i=0;i<a;i++){ %>
  <option value="<%=i+1 %>"><%=i+1 %>일</option>
  <%} %>
</select>
</div>
    </div>
  <div class="field">
    <label>Billing Address</label>
    <div class="fields">
      <div class="twelve wide field">
        <input type="text" name="shipping[address]" placeholder="Street Address">
      </div>
      <div class="four wide field">
        <input type="text" name="shipping[address-2]" placeholder="Apt #">
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
