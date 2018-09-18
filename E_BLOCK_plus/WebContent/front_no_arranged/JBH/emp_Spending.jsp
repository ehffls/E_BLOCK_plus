<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emp_Spending</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->
<div class="ui container">  
<div class="ui secondary  menu">
		<a class="item">상세보기</a> <a class="item">수정</a> <a class="item">삭제</a>

		<div class="right menu">
			<div class="item">
				<div class="ui icon input">
					<input type="text" placeholder="Search..." value=""> <i class="search link icon"></i>
				</div>
			</div>
		</div>
	</div>
	<table class="ui celled  table ">
		<thead>
			<tr>
				<th>사원명</th>
				<th>연봉</th>
				<th>월급</th>
			</tr>
		</thead>
		<tbody>
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