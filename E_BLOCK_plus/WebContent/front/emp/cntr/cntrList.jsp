<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.net.URLDecoder"%>
<%@ page import="javax.mail.*,javax.mail.internet.*, java.util.Properties" %>

<%
	Cookie[] cs = request.getCookies();
	String e_email = null;
	String e_name = null;
	if(cs != null){
		for (int i = 0; i < cs.length; i++) {
			String cs_name = cs[i].getName();
			System.out.print(cs_name);			
			if("name".equals(cs_name)){
				e_name = URLDecoder.decode(cs[i].getValue(),"utf-8");
			}
			else if("email".equals(cs_name)){
				e_email = URLDecoder.decode(cs[i].getValue(),"utf-8");
			}
		}
	}
	System.out.print(e_email);
	System.out.print(e_name);
		
	if(e_email != null){
	//Naver POP3/STMP를 이용한 메일발송 프로그램 설정하기
	  String smtpServer   = "smtp.naver.com";		//SMTP서버명
	  int 	 smtpPort 	  = 465;					//SMTP포트번호
	  String sendMailAddr = "coco-chloe@naver.com";	//계정메일주소
	  final String sendId = "coco-chloe";			//NAVER계정명
	  final String sendPw = "qwer2100";			    //비밀번호
	
	//메일 받는 사람 설정
	String receiveMailAddr = e_email;
	String mailSubject = e_name+" 귀하의 입사를 축하드립니다";
	String mailContent = e_name+"님 OOO사의 가족이 되신것을 진심으로 환영합니다."+"\n"
						 +"언제나 오늘을 기억하며 당신의 무한 역정과 겸손의 자세로"+"\n"
						 +"끊임없이 성장하는 인재가 되시길 기대합니다.";
	
	Properties props = System.getProperties();
	props.put("mail.smtp.host",smtpServer);
	props.put("mail.smtp.port",smtpPort);
	props.put("mail.smtp.auth",true);
	props.put("mail.smtp.ssl.enable",true);
	props.put("mail.smtp.ssl.trust",smtpServer);
	
	Session session2 = Session.getDefaultInstance(props, new Authenticator(){
		protected PasswordAuthentication getPasswordAuthentication(){
			return new PasswordAuthentication(sendId,sendPw);
		}
	});
	
	session2.setDebug(true);
	Message msg = new MimeMessage(session2);
	msg.setFrom(new InternetAddress(sendMailAddr));
	msg.setRecipient(Message.RecipientType.TO, new InternetAddress(receiveMailAddr));
	msg.setSubject(mailSubject);
	msg.setText(mailContent);
	Transport.send(msg);
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 관리</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.css" />
</head>
<body>
	<!-- sidebar -->
	<%@ include file="/front/_includePage/sidemenu.jsp"%>
	<!-- main -->
	<%@ include file="/front/_includePage/mainpage.jsp"%>

	<!--=============== 작성부분 ===============-->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

	<script type="text/javascript">
		function eSearchList() {
			$.ajax({
				method : "post",
				url : "/E_BLOCK_plus/front/emp/cntr/cntrListSearch.jsp",
				success : function(result) {
					$("#eList").html(result);
				},
				error : function(xhrObject) {
					alert(xhrObject.responseText);
				}
			});
		}
	
		function empInsert() {
			$.ajax({
				method : "post",
				url : "/E_BLOCK_plus/front/emp/cntr/cntrAddEmp.jsp",
				success : function(result) {
					$("#eIns").html(result);
				},
				error : function(xhrObject) {
					alert(xhrObject.responseText);
				}
			});
		}
		
		function cntrAddEmp(){
			$("#addForm").attr("method","post");
			$("#addForm").attr("action","/E_BLOCK_plus/emp/cntr/addEmp.ebp");
			$("#addForm").submit();
		}

	</script>


	<div class="ui container" style="margin-top: 15px;">
		<!-- 검색창 시작 -->
		<div class="ui column stackable grid container">
			<div class="column" align="center" style="padding-left: 0px;">
				<h2 class="ui header" style="padding-top: 15px; padding-bottom: 15px">
					<i class="address book outline icon"></i>
					<div class="content">사원 관리</div>
				</h2>
			</div>
		</div>
		<div class="ui grey two item menu" id="menu">
			<a class="item" id="eInsert" onclick="empInsert()">신규 사원 등록 </a>
			<a class="item" id="eSearch" onclick="eSearchList()"> 사원 조회 </a>
		</div>
		<div id="eList"></div>
		<div id="eIns"></div>
		<div id="SetDept"></div>
		<div id="UpdEmp"></div>
	</div>

	<script>
		
		//사이드 메뉴 설정
		$('#').attr("class", "active item");
		$('#').attr("class", "active item");

		
		$('#menu').find('a').click(function() {
	
			$('#menu').find('a').attr('class', 'item');
			$(this).attr('class', 'item active');
			if ($(this).attr('id') == 'eSearch') {
				$("#eList").show();
				$("#eIns").hide();

			
			} else if ($(this).attr('id') == 'eInsert') { 
				$("#eList").hide();
				$("#eIns").show();
			} 	
		});
		
	</script>

	<!--=============== 작성부분 ===============-->



	<%@ include file="/front/_includePage/sticky"%>
</body>
</html>