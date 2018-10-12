<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String Project_Root2 = request.getContextPath();
	/* int i=0; i<cs.length; i++ */
	Cookie[] cs = request.getCookies();
	String e_name = null;
	String e_no = null;
	String d_no = null;
	String au_no = null;

	if (cs != null && cs.length > 0) {
		for (int i = 0; i < cs.length; i++) {
			if ("c_ename".equals(cs[i].getName())) {
				e_name = cs[i].getValue();
			} else if (cs[i].getName().equals("c_eno")) {
				e_no = cs[i].getValue();
			} else if (cs[i].getName().equals("c_dno")) {
				d_no = cs[i].getValue();
			} else if (cs[i].getName().equals("c_auno")) {
				au_no = cs[i].getValue();
			}

		}

	}
	List<Map<String, Object>> list1 = null;
	List<Map<String, Object>> list2 = null;
	
	Object obj = request.getAttribute("newAA");
	if(obj!=null){
		Map<String, Object> map = (Map<String, Object>) obj;
		System.out.print(map);
		list1 = (List<Map<String, Object>>) map.get("sort_list");
		list2 = (List<Map<String, Object>>) map.get("mk_list");
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>등록신청페이지</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script type="text/javascript">
	$('#r_start').calendar({
		type : 'date',
		endCalendar : $('#r_end')
	});
	$('#r_end').calendar({
		type : 'date',
		startCalendar : $('#r_start')
	});
</script>
</head>
<body>
	<div class="ui container" style="margin-top: 20px">
		<form class="ui form" id ="f_newAA">
			<h4 class="ui dividing header">비품등록 신청서</h4>
			<div class="two fields">
				<div class="field">
					<div class="ui labeled input">
						<a class="ui label">신청사원</a> <input type="text" value="<%=e_name%>" readonly="readonly">
					</div>
				</div>
				<div class="field">
					<div class="ui labeled input">
						<a class="ui label">결제부서</a>
						<div class="ui left pointing label">자동적으로 해당부서에 신청됩니다</div>

					</div>
				</div>
			</div>
			<div class="two fields">
				<div class="field">
					<div class="ui labeled input">
						<a class="ui label">비품이름</a> <input type="text" name="eq_name">
					</div>
				</div>
				
			</div>
			<div class="two fields">
			<div class="field">
					<div class="ui large label">비품분류</div>
					<br>

					<select name="eq_sort" class="ui search selection dropdown" id="s_list">
						<%
							for (int i = 0; i < list2.size(); i++) {
						%>
						<option value="<%=list1.get(i).get("eq_sort")%>"><%=list1.get(i).get("eq_sort")%></option>
						<%
							}
						%>
					</select>
				</div>
				</div>
	<div class="two fields">
		<div class="field">
		<div class="ui large label">거래처</div>
					<br>
			<select name="mk_no" class="ui search selection dropdown" id="search-select">
				<%
					for (int i = 0; i < list2.size(); i++) {
				%>
				<option value="<%=list2.get(i).get("mk_no")%>"><%=list2.get(i).get("mk_cname")%></option>
				<%
					}
				%>
			</select>
		</div>
		<div class="field">
			<div class="ui labeled input"></div>
		</div>
	</div>
	<div class="field" style="height: 300px">
		<label>결재사유</label>
		<textarea name="" style="resize: none; height: 80%"></textarea>
	</div>
	<div class="field">
		<div class="ui button" tabindex="0" id="ap_Ok" onclick="newaa()">저장</div>
		<div class="ui button" tabindex="0" id="ap_cancel" onclick="newaa2()">취소</div>
	</div>
	</form>
	</div>
	<script type="text/javascript">
	
	
		$('#s_list').dropdown()
		$('#search-select')
			.dropdown()
		;
		function newaa(){
			$("#f_newAA").attr("method","post")
			$("#f_newAA").attr("action","/E_BLOCK_plus/equip/add/ask.ebp")
			$("#f_newAA").submit()
		}
		function newaa2(){
			location.href="/E_BLOCK_plus/equip/add/addAskList2.jsp"
		}
	</script>
</body>
</html>