<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
#mainImg {
	background-image: url(/E_BLOCK_plus/1_file/img/_common/7.jpg);
	background-size: cover;
	background-position: center;
}
</style>
<%
/* Cookie[] cookies = request.getCookies();
String path = null;
if(cookies!=null){
	for(Cookie cookie: cookies){
		if(cookie.getName().equals("c_eno")||cookie.getName().equals("c_ename")||cookie.getName().equals("c_auno"))
			break;
		else
			path = "/E_BLOCK_plus/emp/login/login.jsp";
			//out.print(cookie.getName()+", "+cookie.getValue());
	}
	if(path!=null)
		response.sendRedirect(path);
} */
%>
<script type="text/javascript">


</script>
<div class="ui black top fixed inverted menu topmenu">
	<div class="ui container">
		<div class="ui large secondary inverted menu topsecondary">
			<a class="toc item sidemenu_icon" id="sidemenu_icon"> <i class="sidebar icon"></i>
			</a> <a class="item" id="mainpage" href="/E_BLOCK_plus/emp/cmt/myList.jsp">메인페이지</a> <a class="item" id="approval">전자결재</a>
		</div>
		<!-- 우측메뉴 시작 -->
		<div class="right inverted menu primary">
			<div class="item"><%=e_name %></div>
			<a class="ui item" href='/E_BLOCK_plus/emp/info/persList'> 내정보 </a> <a class="ui item" href='/E_BLOCK_plus/emp/login/logout.jsp'> Logout </a>
		</div>
	</div>
	<!-- 우측메뉴 끝 -->
</div>
<!-- 메인페이지 구성 시작 -->
<!-- 상단화면 시작 -->
<div id="sticky" class="ui sticky topmenu">
	<div class="ui inverted vertical masthead center aligned segment" style="padding-top: 0px; padding-bottom: 0px;height: 42.844px" id="topmenu">
		<div class="ui container">
			<div class="ui secondary inverted menu topsecondary">
				<a class="toc item sidemenu_icon" id="sidemenu_icon"> <i class="sidebar icon"></i>
				</a> <a class="item" id="mainpage" href="/E_BLOCK_plus/emp/cmt/myList.jsp">메인페이지</a> <a class="item" id="approval">전자결재</a>
				<!-- 우측메뉴 시작 -->
				<div class="right item"><%=e_name %></div>
				<a class="ui item" href='/E_BLOCK_plus/emp/info/persList'> 내정보 </a> <a class="ui item" href='/E_BLOCK_plus/emp/login/logout.jsp'> <!--    <a class="ui item active" href='/E_BLOCK_plus/emp/login/logout.ebp'> --> Logout
				</a>

				<!-- 우측메뉴 끝 -->
			</div>
		</div>
		<br>
	</div>
</div>
<!-- <div id="context"> -->
<!-- 모두 sticky에 context로 묶여있어야 함. -->
<div class="ui inverted vertical masthead center aligned segment" id="mainImg" style="padding-top: 50px; padding-bottom: 50px;">
	<div class="ui text container" style="margin-top: 20px;">
		<img src="/E_BLOCK_plus/1_file/img/_common/logo_black_edge_font.png" style="margin-bottom: 20px; width: 250px; height: 60px" id="logo">
		<!-- 움찔 이벤트 스크립트 시작 -->
			<script type="text/javascript">
				$('#logo')
				.transition('set looping')
				.transition('flash','4500ms');
			</script>
			<!-- 움찔 이벤트 스크립트 끝 -->
	</div>
</div>
<!-- 메인페이지 구성 끝 -->
