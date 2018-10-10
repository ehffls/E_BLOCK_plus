<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% %>
<script type="text/javascript">

</script>
<!-- 메인페이지 구성 시작 -->
<!-- 상단화면 시작 -->
<div id="sticky" class="ui sticky">
	<div class="grey ui inverted vertical masthead center aligned segment">
		<div class="ui container">
			<div class="ui large secondary inverted menu">
				<a class="toc item" id="sidemenu_icon"> <i class="sidebar icon"></i>
				</a> <a class="item" id="mainpage" href="">메인페이지</a> <a class="item" id="approval">전자결재</a>
				<!-- 우측메뉴 시작 -->
  <div class="right item"><%=e_name %></div>
    <a class="ui item active" href='/E_BLOCK_plus/front/emp/login/logout.jsp'>
 <!--    <a class="ui item active" href='/E_BLOCK_plus/emp/login/logout.ebp'> -->
      Logout
    </a>
				
				<!-- 우측메뉴 끝 -->
			</div>
		</div>
		<br>
	</div>
</div>
<div id="context">
	<!-- 모두 sticky에 context로 묶여있어야 함. -->
	<div class="grey ui inverted vertical masthead center aligned segment">
		<div class="ui text container" style="margin-top: 20px;">
			<img src="/E_BLOCK_plus/1_file/img/_common/logo_white_font.png" style="margin-bottom: 20px; width: 250px; height: 60px"><br>
		</div>
	</div>
	<!-- 메인페이지 구성 끝 -->
