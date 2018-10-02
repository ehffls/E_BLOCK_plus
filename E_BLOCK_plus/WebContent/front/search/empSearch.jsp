<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원검색</title>
</head>
<body>
	    <table class="ui inverted gray selectable celled right aligned table">
      <thead>
        <th class="left aligned">사원이름</th>
        <th>사원연락처</th>
        <th>사원이메일</th>
        <th>사원주소</th>
      </thead>
      <tbody>
        <tr>
          <td class="left aligned">Lianne</td>
          <td>23</td>
          <td>32g</td>
          <td>43g</td>
        </tr>
        <tr>
          <td class="left aligned">Joette</td>
          <td>21</td>
          <td>13g</td>
          <td>31g</td>
        </tr>
        <tr>
          <td class="left aligned">Le</td>
          <td>28</td>
          <td>39g</td>
          <td>23g</td>
        </tr>
        <tr>
          <td class="left aligned">Sacha</td>
          <td>46</td>
          <td>43g</td>
          <td>13g</td>
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
</body>
</html>