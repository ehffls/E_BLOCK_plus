<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.HashMap , java.util.List, java.util.ArrayList" %>
<%
	
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	Map<String,Object> pMap1 = new HashMap<String,Object>(); 
	pMap1.put("name", "강감찬");
	pMap1.put("no", 1);
	pMap1.put("job", "의사");
	Map<String,Object> pMap2 = new HashMap<String,Object>();
	pMap2.put("name", "이순신");
	pMap2.put("no", 2);
	pMap2.put("job", "판사");
	Map<String,Object> pMap3 = new HashMap<String,Object>();
	pMap3.put("name", "김민수");
	pMap3.put("no", 3);
	pMap3.put("job", "카레이서");
	Map<String,Object> pMap4 = new HashMap<String,Object>();
	pMap4.put("name", "홍길동");
	pMap4.put("no", 4);
	pMap4.put("job", "도사");
	Map<String,Object> pMap5 = new HashMap<String,Object>();
	pMap5.put("name", "김철수");
	pMap5.put("no", 5);
	pMap5.put("job", "학생");
	list.add(0,pMap1);
	list.add(1,pMap2);
	list.add(2,pMap3);
	list.add(3,pMap4);
	list.add(4,pMap5);
    int a = 5;
%>
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
<div class="ui container">
<table class="ui celled table">
      <thead>
        <tr><th>Header</th>
        <th>Header</th>
        <th>Header</th>
      </tr></thead>
      <tbody>
<%
	Map map = null;
	for(int i=0;i<a;i++){
	map = (HashMap)list.get(i);
%>
        <tr>
          <td><%=map.get("name") %></td>
          <td><%=map.get("no") %></td>
          <td><%=map.get("job") %></td>
        </tr>
<%
	}
%>
      </tbody>
      <tfoot>
        <tr><th colspan="3">
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
        </th>
      </tr></tfoot>
    </table>
</div>

<!--=============== 작성부분 ===============-->



<%@ include file="/front/_includePage/sticky" %>
</body>
</html>