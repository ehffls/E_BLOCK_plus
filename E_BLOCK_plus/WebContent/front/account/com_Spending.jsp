<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>com_Spending</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>




	<!--=============== 작성부분 ===============-->
	<div class="ui container" style="margin-top: 5px;">
		<!-- 검색창 시작 -->
		<div class="ui two column stackable grid container">
			<div class="column" align="left" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 5px;">
					<i class="user circle icon"></i>
					<div class="content">사원 지출 내역</div>
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
					<input type="text" placeholder="검색" />
				</div>
				<div class="ui grey large button" onclick="javascript:ss()" 
				     style="margin-top: 1px; padding-left: 13px; padding-right: 13px; margin-right: 0px;">급여지급내역</div>
			</div>
		</div>
		<!-- 검색창 끝 -->
		<table class="ui celled  table" style="margin-top: 5px;">
			<thead>
				<tr>
					<th>날짜</th>
					<th>사원 총 지출액</th>
					<th>사원 월 지출액</th>
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
							<div class="large ui buttons">
							  <button class="ui button" style="margin-top: 1px;">수정하기</button>
							   <div class="or"></div>
							  <button class="ui button" style="margin-top: 1px;">상세보기</button>
							</div>
						</div>
					</th>
				</tr>
			</tfoot>
		</table>
	</div>

<script type="text/javascript">
	function ss(){
		location.href="./payList.jsp";
	}
</script>

	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>