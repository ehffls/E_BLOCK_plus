<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//ajax로 넘어온 카탈로그번호
	String ac_no = request.getParameter("ac_no");
%>
<div align="center">
	<i class="notched circle loading huge icon"></i>
</div>
<!-- 신청아이콘 -->
<div class="ui icon message">
	<i class="edit icon"></i>
	<div class="content">
		<div class="header">신청서 작성</div>
		<p>아래 사항을 모두 입력하세요.</p>
	</div>
</div>

<br>

<!-- 입력사항 -->
<form id="f_esmt" class="ui form">

	<!-- 카탈로그번호 -->
	<div class="ui left action fluid input">
		<div class="ui teal icon button" >
			<i class="thumbtack icon"></i>
		</div>
		<input type="text" name="pec_no" placeholder="카탈로그번호" value="<%=ac_no%>" readonly="readonly">
	</div>
	
	<br>
	
	<!-- 이메일주소 -->
	<div class="ui left action fluid input">
		<div class="ui teal icon button">
			<i class="thumbtack icon"></i>
		</div>
		<input id="esmi_email" name="pesti_email" type="text" placeholder="견적서 수령희망 이메일주소">
	</div>
	
	<br>
	
	<!-- 비고 -->
	<div class="ui left action fluid input">
		<div class="ui teal icon button">
			<i class="thumbtack icon"></i>
		</div>
		<input id="p_note" name="p_note" type="text" placeholder="비고">
	</div>
</form>

<!-- 구분선 -->
<div class="ui section divider"></div>

<!-- 신청버튼 -->
<div align="center">
	<button id="btn_doAsk"
			class="ui left labeled icon large teal button"
			data-tooltip="견적서가 신청됩니다.">
	  <i class="edit icon"></i>
	  	신청
	</button>
</div>



<!-- 신청하기 -->
<script type="text/javascript">
	//신청버튼 이벤트 처리
	$("#btn_doAsk").on('click',function(){
		$("#f_esmt").attr("method","post");
		$("#f_esmt").attr("action","/E_BLOCK_plus/esti/catalog/insupd"); //카탈로그로부터 견적서 신청하기
		$("#f_esmt").submit();
		alert("견적서 신청 접수되었습니다.");
	}); 
</script>
