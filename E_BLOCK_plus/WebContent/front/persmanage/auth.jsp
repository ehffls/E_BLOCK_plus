<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권한 부여</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>


<!--=============== 작성부분 ===============-->


	<!-- 권한부여 페이지 -->
	<div class="ui container" style="margin-top: 5px;">
			<!-- 검색창 시작 -->
			<div class="ui two column stackable grid container">
			<div class="column" align="left" style="padding-left: 0px;">
				<h2 class="ui header"style="padding-top: 5px;">
					<i class="chess king icon"></i>
					<div class="content"> 권한 부여 </div>
				</h2>
			</div>
			<div class="column" align="right" style="padding-right: 0px;">
			<div class="ui left action right icon input">
				<!-- dropdown 시작 -->			
				<div class="ui basic floating dropdown button">
					<div div class="default text">권한</div>
					<i class="dropdown icon"></i>
						<div class="menu" style="top: 31px;">
							<div class="item" data-value="name">권한</div>
							<div class="item" data-value="dname">부서번호</div>
							<div class="item" data-value="num">부서명</div>
							<div class="item" data-value="addr">이름</div>
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
					<th>부서번호</th>
					<th>부서명</th>
					<th>이름</th>
					<th>권한</th>
				</tr>
			</thead>
			<tbody>
				<tr class="center aligned">
					<td>444</td>
					<td>멍멍이부</td>
					<td>멍멍이</td>
					<td>사원</td>
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
							<div class="ui large button" onclick="ac_add()" style=" margin-top: 1px;">수정하기</div>
							</div>
					</th>
				</tr>
			</tfoot>
		</table>
	
		<div class="ui mini modal" id="acc_add">
			<div class="header" align="center">권한부여</div>

			<div class="content">

				<div class="text">부서 번호</div>
				<div class="ui input" style="width: 100%"><input type="text"></div>
			<p>
				<div class="text">부서명</div>
				<div class="ui input" style="width: 100%"><input type="text"></div>
			<p>	
				<div class="text">이름</div>
				<div class="ui input" style="width: 100%"><input type="text"></div>
			<p>	
				<div class="text">권한</div>
				<div class="ui input" style="width: 100%"><input type="text"></div>

				<div class="actions">
					<br>
					<div align="center">
					<div class="ui a button">등록</div>
					<div class="ui cancel button">취소</div>
					</div>
				</div>

			</div>
		</div>

	</div>

<script type="text/javascript">
	//사이드 메뉴 설정
	$('#sm_persmanage').attr("class","active item");
	$('#sm_persmanage_auth').attr("class","active item");

   function ac_add(){
      $('#acc_add').modal('show')
   }
   
	$(document).ready(function(){
		$('.ui.dropdown').dropdown();
	});	
</script>


<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>