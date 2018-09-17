<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->
<script type="text/javascript">
	function ac_add(){
		$('#acc_add').modal('show')
	}
</script>
<div class="ui mini modal" id="acc_add" >
  <div class="header">거래처 등록</div>
  
    <div class="content">
    <div class="bady">
    <div class="text">회사 이름</div>
    <div class="ui input" style="width:100%"><input type="text" ></div>
    <div class="text">담당자 이름</div>
    <div class="ui input" style="width:100%"><input type="text" ></div>
    <div class="text">회사 이름</div>  
    <div class="ui input" style="width:100%"><input type="text" ></div>
    <div class="text">연락처</div>     
    <div class="ui input" style="width:100%"><input type="text" ></div>
    <div class="text">팩스번호</div>   
    <div class="ui input" style="width:100%"><input type="text" ></div>
    <div class="text">이메일</div>     
    <div class="ui input" style="width:100%"><input type="text" ></div>
     <div class="actions">
     <br>
    <div class="ui a button">등록</div>
    <div class="ui cancel button">취소</div>
  </div>
    
    </div>
  </div>
</div>   


<div class="ui container">  
<div tabindex="0" class="ui button"  onclick="ac_add()">
  거래처 등록
</div>
<div tabindex="0" class="ui button">
  거래처 삭제
</div>
<table class="ui celled  table ">
		<thead>
			<tr>
				<th>Header</th>
				<th>Header</th>
				<th>Header</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<div class="ui ribbon label">First</div>
				</td>
				<td>Cell</td>
				<td>Cell</td>
			</tr>
			<tr>
				<td>Cell</td>
				<td>Cell</td>
				<td>Cell</td>
			</tr>
			<tr>
				<td>Cell</td>
				<td>Cell</td>
				<td>Cell</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<th colspan="3">
					<div class="ui right floated pagination menu">
						<a class="icon item"> <i class="left chevron icon"></i>
						</a> <a class="item">1</a> <a class="item">2</a> <a class="item">3</a> <a class="item">4</a> <a class="icon item"> <i class="right chevron icon"></i>
						</a>
					</div>
				</th>
			</tr>
		</tfoot>
	</table>
</div>

<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>