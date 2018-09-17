<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>재고관리(사원)</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp" %>
</head>
<body>
<!-- sidebar -->
<%@ include file="/front/_includePage/sidemenu.jsp" %>
<!-- main -->
<%@ include file="/front/_includePage/mainpage.jsp" %>




<!--=============== 작성부분 ===============-->
<!-- =====================버튼시작=================================== -->
	<div class = "ui secondary menu">
	<div class = "right menu">
	<button class="ui button">신청</button>
	<button class="ui button">수정</button>
	<button class="ui button">뒤로가기</button>
	</div>
	</div>
<!-- =====================뒤로가기 버튼끝  =================================== -->
<!-- =====================재고리스트 시작=================================== -->
    <div class="column">
    <table class="ui inverted gray selectable celled right aligned table">
      <thead>
        <th class="left aligned">품번</th>
        <th>품목구분</th>
        <th>품명</th>
        <th>수량</th>
        <th>단가</th>
      </thead>
      <tbody>
        <tr>
          <td class="left aligned">Lianne</td>
          <td>23</td>
          <td>32g</td>
          <td>43g</td>
          <td>43$</td>
        </tr>
        <tr>
          <td class="left aligned">Joette</td>
          <td>21</td>
          <td>13g</td>
          <td>31g</td>
          <td>31$</td>
        </tr>
        <tr>
          <td class="left aligned">Le</td>
          <td>28</td>
          <td>39g</td>
          <td>23g</td>
          <td>23$</td>
        </tr>
        <tr>
          <td class="left aligned">Sacha</td>
          <td>46</td>
          <td>43g</td>
          <td>13g</td>
          <td>13$</td>
        </tr>
        <tr>
          <td class="left aligned">Bruna</td>
          <td>9</td>
          <td>47g</td>
          <td>12g</td>
          <td>12$</td>
        </tr>
        <tr>
          <td class="left aligned">Bruna</td>
          <td>9</td>
          <td>47g</td>
          <td>12g</td>
          <td>12$</td>
        </tr>
      </tbody>
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
    </table>
  </div>
<!-- =====================재고리스트 끝=================================== -->



<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>