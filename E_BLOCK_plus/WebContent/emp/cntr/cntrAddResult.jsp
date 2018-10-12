<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				e_name = cs[i].getValue();
			}
			else if("email".equals(cs_name)){
				e_email = cs[i].getValue();
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
	response.sendRedirect("./cntrList.jsp");
%>
    