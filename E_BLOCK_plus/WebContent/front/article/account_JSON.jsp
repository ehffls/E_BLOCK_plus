<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	String targetName = "";//여기에 request객체에 담은 리스트의 name을 쓰세요

	List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	Map<String,Object> pMap = null; 
	for(int i=0;i<100;i++){
		pMap = new HashMap<String,Object>();
		pMap.put("band", i);
		pMap.put("song", i);
		pMap.put("son", i);
		list.add(pMap);
	}
	pMap = new HashMap<String,Object>();
	pMap.put("data", list);
	Gson gs = new Gson();
	String json = gs.toJson(pMap);
	out.println(json);
%>