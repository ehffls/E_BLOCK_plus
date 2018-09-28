<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 지급 내역</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
<script type="text/javascript">
	$(function(){
		//sidemenu처리 부분
		$('#mainpage').attr("class","active item");
		$('#sm_main').attr("class","active item");
	});
</script>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->

	<!-- 급여 지급 내역 페이지 -->
	<div class="ui container" style="margin-top: 5px;">
			<!-- 검색창 시작 -->
			<div class="ui two column stackable grid container">
			<div class="column" align="left" style="padding-left: 0px;">
				<h2 class="ui header"style="padding-top: 5px;">
					<i class="won sign icon"></i>
					<div class="content"> 급여 지급 내역 </div>
				</h2>
			</div>
			<div class="column" align="right" style="padding-right: 0px;">
			<div class="ui left action right icon input">
				<!-- dropdown 시작 -->			
				<div class="ui basic floating dropdown button">
					<div div class="default text">이름</div>
					<i class="dropdown icon"></i>
						<div class="menu" style="top: 31px;">
							<div class="item" data-value="name">이름</div>
							<div class="item" data-value="dname">부서명</div>
							<div class="item" data-value="date">날짜</div>
						</div>
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
					<th>부서명</th>
					<th>사원이름</th>
					<th>날짜</th>
					<th>급여</th>
				</tr>
			</thead>
			<tbody>
				<tr class="center aligned">
					<td>멍멍이부</td>
					<td>멍멍이</td>
					<td>3001/01/01</td>
					<td>3,500,000원</td>
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
							<div class="ui large button" onclick="ss" style=" margin-top: 1px;">급여지급</div>
						</div>
					</th>
				</tr>
			</tfoot>
		</table>
	</div>

<script type="text/javascript">
	$(document).ready(function(){
		$('.ui.dropdown').dropdown();
	});	
</script>


<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>