<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	Map<String,Object> pMap = null; 
	for(int i=0;i<100;i++){
		pMap = new HashMap<String,Object>();
		pMap.put("esti_ano", i+1);
		pMap.put("ec_no", i+2);
		pMap.put("ec_name", i+3);
		pMap.put("esti_price", i+4);
		pMap.put("ask_date", i+5);
		
		pMap.put("sign_eno1", i+6);
		pMap.put("outcome1", i+7);
		pMap.put("sign_date1", i+8);
		
		pMap.put("esti_email", i+9);
		pMap.put("content", i+10);
		
		pMap.put("sign_eno2", i+11);
		pMap.put("outcome2", i+12);
		pMap.put("sign_date2", i+13);
		
		pMap.put("sign_eno3", i+14);
		pMap.put("outcome3", i+15);
		pMap.put("sign_date3", i+16);
		
		pMap.put("note", i+17);
		
		list.add(pMap);
	}
	pMap = new HashMap<String,Object>();
	pMap.put("data", list);
	Gson gs = new Gson();
	String json = gs.toJson(pMap);
	out.println(json);
%>