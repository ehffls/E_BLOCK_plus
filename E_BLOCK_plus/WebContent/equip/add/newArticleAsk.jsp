<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%	
	String Project_Root2 = request.getContextPath();
/* int i=0; i<cs.length; i++ */
Cookie[] cs = request.getCookies();
String e_name=null;
String e_no=null;
String d_no=null;
String au_no=null;

if(cs != null&& cs.length>0 ){
for(int i=0;i<cs.length;i++){
	if("c_ename".equals(cs[i].getName())){
		 e_name =cs[i].getValue();
	}
	else if(cs[i].getName().equals("c_eno")){
		e_no = cs[i].getValue();
	}
	else if(cs[i].getName().equals("c_dno")){
		d_no = cs[i].getValue();
	}
	else if(cs[i].getName().equals("c_auno")){
		au_no = cs[i].getValue();
	}
		
	
	} 

}
 List list1 = new ArrayList();
 List list2 = new ArrayList();
 
 List<Map<String,Object>>list =(List<Map<String,Object>>)request.getAttribute("newAA"); 
 
 list.get(1);
 list1= (List<Map<String,Object>>)list.get(0);
 list2= (List<Map<String,Object>>)list.get(1);
 
%> 
<html>
<head>
<meta charset="UTF-8">
<title>등록신청페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script type="text/javascript">
$('#r_start').calendar({
  type: 'date',
  endCalendar: $('#r_end')
});
$('#r_end').calendar({
  type: 'date',
  startCalendar: $('#r_start')
});
</script>
</head>
<body>
<div class="ui container" style="margin-top:20px">
  <form class="ui form">
	<h4 class="ui dividing header">비품등록 신청서</h4>
	<div class="two fields">
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">신청사원</a>
		  <input type="text" value="<%=e_name %>" readonly="readonly">
		</div>
	  </div>
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">결제부서</a>
		 <div class="ui left pointing label">
     자동적으로 해당부서에 신청됩니다
    	</div>

		</div>
	  </div>
	</div>
	<div class="two fields">
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">비품이름</a>
		  <input type="text">
		</div>
	  </div>
	  <div class="field">
	  <div class="ui large label">
  			비품분류
		</div>
	  
					<div class="ui dropdown" id="s_list">
  				<div class="text"></div>
 					 <i class="dropdown icon"></i>
				</div>
				</div>
	</div>
	<div class="two fields">
	  <div class="field">
		<select class="ui search selection dropdown" id="search-select">
		<%for(int i=0;i<list2.size();i++){ %>
  <option value="<%=i %>"><%=list2.get(i) %></option>
  <%} %>
</select>
	  </div>
	  <div class="field">
		<div class="ui labeled input">
		  
		</div>
	  </div>
	</div>
	  <div class="field" style="height:300px">
		<label>결재사유</label>
		<textarea style="resize:none; height:80%"></textarea>
	  </div>
	  <div class="field">
		<div class="ui button" tabindex="0" id="ap_Ok">저장</div>
		<div class="ui button" tabindex="0" id="ap_cancel">취소</div>
	  </div>
  </form>
</div>
<script type="text/javascript">


  $('#s_list').dropdown({
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

  })
  $('#search-select')
  .dropdown()
;
</script>
</body>
</html>