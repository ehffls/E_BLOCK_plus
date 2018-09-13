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

	<!-- 근태 결제 승인 내역 페이지 -->
	<div class="ui container" style="margin-top: 5px;">
			<!-- 검색창 시작 -->
			<div class="ui two column stackable grid container">
			<div class="column" align="left" style="padding-left: 0px;">
				<h2 class="ui header"style="padding-top: 5px;">
					<i class="paste icon"></i>
					<div class="content"> 근태 결제 승인 내역 </div>
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
					<th>결제일자</th>
					<th>부서명</th>
					<th>신청 사원</th>
					<th>근태분류</th>
					<th>신청사유</th>
					<th>시작일자</th>
					<th>종료일자</th>
					<th>전체일수</th>
				</tr>
			</thead>
			<tbody>
				<tr class="center aligned">
					<td>3000/01/01</td>
					<td>멍멍이부</td>
					<td>멍멍이</td>
					<td>휴가</td>
					<td>휴가감</td>
					<td>3000/02/01</td>
					<td>3000/02/10</td>
					<td>10일</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="8">
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