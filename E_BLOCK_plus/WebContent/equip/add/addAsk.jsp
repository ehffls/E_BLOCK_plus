<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	String Project_Root3 = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새비품신청작성</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script type="text/javascript">
<!-----작성승인----->	
	function j_ok(){
		/* alert("처리되었습니다."); */
		/* location.href = "./pevAdd_result.jsp"; */
		var formData = $("#ask_form").serialize();
		$.ajax({
			url : "/E_BLOCK_plus/equip/add/ask.ebp",
			type : "POST",
			data : formData,
			success : function(data) {
				 alert(data);
				 if(data==0){
					 alert("실패")
				 }
				 else if(data==1){
					 location.href="./addAskList.jsp";
				 }
			},	
			
			error : function(xhr, status){
				alert(xhr+":"+status);
			}
		});
	}
<!-----작성취소 처리중 ----->
	function j_cancle(){
		/* alert("취소되었습니다."); */
		location.href = "./addAskList.jsp";  
	}
</script>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->

<div class="ui container" style="margin-top: 10px">
<h2 style="margin-top:20px">새비품신청작성</h2>
</div>
<div id="form_1">
<div class="ui container" style="margin-top:20px">
  <form class="ui form" id="ask_form">
	<div class="three fields">
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">비품신청 번호</a>
		  <input type="text" name="eq_addno">
		</div>
	  </div>
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">신청사원 번호</a>
		  <input type="text" name="ask_eno">
		</div>
	  </div>
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">결재사원 번호</a>
		  <input type="text" name="sign_eno">
		</div>
	  </div>
	</div>
	<div class="three fields">
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">신청일자</a>
		  <input type="text" name="ask_date">
		</div>
	  </div>
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">비품분류</a>
		  <input type="text" name="eq_sort">
		</div>
	  </div>
	  <div class="field">
		<div class="ui labeled input">
		  <a class="ui label">비품이름</a>
		  <input type="text" name="eq_name">
		</div>
	  </div>
	</div>
	  <div class="field">
		<div class="ui submit button" onclick="j_ok()">저장</div>
		<div class="ui submit button" onclick="j_cancle()">취소</div>
	  </div>
  </form>
</div>
</div>

<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>