<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//ajax로 넘어온 카탈로그번호
	String ac_no = request.getParameter("ac_no");
%>
<!-- 신청아이콘 -->
<div class="ui icon message">
	<i class="edit icon"></i>
	<div class="content">
		<div class="header">결재하기</div>
		<p>승인/기각 선택</p>
	</div>
</div>

<br>

<!-- 입력사항 -->
<form id="f_esmt" class="ui form">

	<!-- 카탈로그번호 -->
	<div class="ui left action fluid input">
		<button class="ui orange icon button">
			<i class="thumbtack icon"></i>
		</button>
		<input type="text" placeholder="카탈로그번호" value="<%=ac_no%>">
	</div>
	
	<br>
	
	<!-- 이메일주소 -->
	<div class="ui left action fluid input">
		<button class="ui orange icon button">
			<i class="thumbtack icon"></i>
		</button>
		<div class="field" style="width: 100%">
          <textarea style="height: 120px"></textarea>
        </div>
	</div>
</form>

<!-- 구분선 -->
<div class="ui section divider"></div>

<!-- 신청버튼 -->
<div align="center">
	<button id="btn_doSubmit"
			class="ui left labeled icon large orange button"
			data-tooltip="해당 신청이 승입됩니다.">
	  <i class="edit icon"></i>
	  	승인
	</button>
	<button id="btn_doReject"
			class="ui left labeled icon large orange button"
			data-tooltip="해당 신청이 기각됩니다.">
	  <i class="edit icon"></i>
	  	기각
	</button>
</div>



<!-- 신청하기 -->
<script type="text/javascript">
	//승인버튼 이벤트 처리
	$("#btn_doSubmit").on('click',function(){
		$("#f_esmt").attr("method","post");
		$("#f_esmt").attr("action","../catalog/esti_result.jsp");  
		$("#f_esmt").submit();
		alert("승인처리 되었습니다.");
	}); 
	//기각버튼 이벤트 처리
	$("#btn_doReject").on('click',function(){
		$("#f_esmt").attr("method","post");
		$("#f_esmt").attr("action","../catalog/esti_result.jsp");  
		$("#f_esmt").submit();
		alert("기각처리 되었습니다.");
	}); 
</script>
