<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인사평가 목록</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>


<!--=============== 스크립트 영역 시작 ===============-->
<script type="text/javascript">
<!-- 작성처리 -->	
	function il_write() {
		$('#i_modal').modal('show')
	}	 
<!-- 검색처리 -->	
	function il_search() {
		alert("검색처리중..");
	}
</script>
<!--=============== 스크립트 영역  끝 ===============-->

<!--=============== 스크립트 영역 ===============-->
<script type="text/javascript">
	$(document).ready(function(){	
		$("#d_asc").dropdown();
	});
</script>
<!--=============== 스크립트 영역 ===============-->

<!--=============== 작성부분 ===============-->
<!--=============== 목록 시작 ===============-->
	<div class="column">
<!--=============== 메뉴 시작 ===============-->
<div class="ui secondary menu">

  <div class="ui selection dropdown" id="d_asc">
  <input type="hidden" name="gender">
  <i class="dropdown icon"></i>
  <div class="default text">정렬</div>
  <div class="menu">
    <div class="item" data-value="1">가나다순</div>
    <div class="item" data-value="0">높은부서순</div>
    <div class="item" data-value="0">낮은부서순</div>
  </div>
</div>
  <div class="left menu">
    <div class="item">
      <div class="ui action left icon input">
        <i class="search icon"></i>
        <input type="text" placeholder="Search">
        <button class="ui button" onclick="i_search()">검색</button>
      </div>
    </div>
  </div>
</div>
<!--=============== 메뉴 끝 ===============-->
		<table class="ui celled selectable aligned table" style="width: 452px;">
			<thead>
				<tr>
					<th class="left aligned">부서명</th>
					<th>사원이름</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="left aligned">부서명</td>
					<td>이름</td>
					<td><button class="ui button" onclick="il_write()">작성</button></td>
				</tr>
			</tbody>			
<!--=============== 페이지 네이션 시작 ===============-->
			<tfoot>
			<tr>
				<th colspan="5">
					<div class="ui right floated pagination menu">
						<a class="icon item"> <i class="left chevron icon"></i>
						</a> <a class="item">1</a> <a class="item">2</a> <a class="item">3</a> <a class="item">4</a> <a class="icon item"> <i class="right chevron icon"></i>
						</a>
					</div>
				</th>
			</tr>
		</tfoot>
<!--=============== 페이지 네이션 끝 ===============-->
		</table>
	</div>
<!--=============== 목록 끝  ===============-->  

  <%@ include file="./insaWrite.jsp" %>


<!--=============== 작성부분 ===============-->
<%@ include file="/front/_includePage/sticky" %>
</body>
</html>