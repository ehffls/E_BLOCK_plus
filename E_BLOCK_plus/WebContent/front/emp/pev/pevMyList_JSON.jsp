<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String targetName = "pevList";//여기에 request객체에 담은 리스트의 name을 쓰세요

	List<Map<String,Object>> list = (List<Map<String,Object>>)request.getAttribute("pevList");	
	Map<String,Object> pMap = null;
	pMap = new HashMap<String,Object>();
	pMap.put("data", list);
	Gson gs = new Gson();
	String json = gs.toJson(pMap);
	out.println(json);
%>