<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 결제</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->
<script type="text/javascript">
	function menu_add1(){
		location.href="./paygoods.jsp"
	}
</script>
<div class="ui container">  
		<div class="ui red three item menu">
  	<a class="item " id="menu"onclick="menu_add1()" >
 	   현재물품신청
  	</a>
  	<a class="item active" id="menu_add" >
  	  추가물품신청
  	</a>
  	<div class="item">
				<div class="ui icon input">
					<input type="text" placeholder="Search..." value=""> <i class="search link icon"></i>
				</div>
			</div>
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