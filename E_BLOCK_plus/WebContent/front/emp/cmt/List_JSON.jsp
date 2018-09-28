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
	for(int i=1;i<6;i++){
		pMap = new HashMap<String,Object>();
		pMap.put("title", "출근");
		pMap.put("start", "2018-10-0"+i+"T08:1"+i+":55");
		list.add(pMap);
		pMap = new HashMap<String,Object>();
		pMap.put("title", "퇴근");
		pMap.put("start", "2018-10-0"+i+"T20:1"+i+":55");
		list.add(pMap);
	}
	Gson gs = new Gson();
	String json = gs.toJson(list);
	out.println(json);
%>