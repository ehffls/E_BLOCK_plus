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

	<!-- 부서관리 페이지 -->
	<div class="ui container" style="margin-top: 5px;">
			<!-- 검색창 시작 -->
			<div class="ui two column stackable grid container">
			<div class="column" align="left" style="padding-left: 0px;">
				<h2 class="ui header"style="padding-top: 5px;">
					<i class="archive icon"></i>
					<div class="content"> 부서 관리 </div>
				</h2>
			</div>
			<div class="column" align="right" style="padding-right: 0px;">
			<div class="ui left action right icon input">
				<!-- dropdown 시작 -->			
				<div class="ui basic floating dropdown button">
					<div class="text">이름</div>
					<i class="dropdown icon"></i>
				</div>
				<!-- dropdown 끝 -->			
				<i class="search icon"></i> 
				<input type="text" placeholder="검색"/>
			</div>
			</div>
			</div>
			<!-- 검색창 끝 -->
			<table class="ui fixed single line celled table" style="margin-top: 5px;">
			<thead>
				<tr class="center aligned">
					<th>부서번호</th>
					<th>부서명</th>
					<th>연락처</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
				<tr class="center aligned">
					<td>444</td>
					<td>멍멍이부</td>
					<td>000-0000-0000</td>
					<td>멍멍시 멍멍구 멍멍동 멍멍-멍멍</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="4">
						<div class="ui right floated pagination menu">
							<a class="icon item">
							 	<i class="left chevron icon"></i>
							</a> 
								<a class="item">1</a> 
								<a class="item">2</a> 
								<a class="item">3</a>
								<a class="item">4</a> 
								
							<a class="icon item"> 
								<i class="right chevron icon"></i>
							</a>
						</div>
							<div align="right">
							<div class="ui large button">수정하기</div>
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