<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	Map<String,Object> pMap = null; 
	for(int i=0;i<100;i++){
		pMap = new HashMap<String,Object>();
		pMap.put("ec_no", i);
		pMap.put("ec_name", i);
		pMap.put("ec_price", i);
		list.add(pMap);
	}
	pMap = new HashMap<String,Object>();
	pMap.put("data", list);
	Gson gs = new Gson();
	String json = gs.toJson(pMap);
	out.println(json);
%>