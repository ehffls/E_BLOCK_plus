<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">
// 사이드바 여는 코드
$(document)
    .ready(function() {
      $('.masthead')
        .visibility({
          once: false,
          onBottomPassed: function() {
            $('.fixed.menu').transition('fade in');
          },
          onBottomPassedReverse: function() {
            $('.fixed.menu').transition('fade out');
          }
        });
      $("#sidemenu_icon").click(function(){
    		$("#sidebar").sidebar('setting', 'transition', 'overlay')
    		.sidebar('toggle');
    	});
    });
</script>
<!-- 사이드메뉴 시작 -->
<div class="ui vertical inverted sidebar menu left" id="sidebar">
  <!-- 로고 시작 -->
  <div class="item">
    <img src="/E_BLOCK_plus/1_file/img/_common/logo_white_all.png" style="width: 50%; height: 50%">
  </div>
  <!-- 로고 끝 -->
  <!-- 메인페이지 시작 -->
  <a class="active item" href="메인페이지">메인페이지</a>
  <!-- 메인페이지 끝 -->
  <!-- 마이페이지 시작 -->
  <div class="item">
 	<div class="header">마이페이지</div>
  	<div class="menu">
      <a class="item" href="내 정보 페이지">
        내 정보 페이지
      </a>
      <a class="item" href="내 출퇴근 내역 페이지">
        내 출퇴근 내역 페이지
      </a>
    </div>
</div>
<!-- 마이페이지 끝 -->
<!-- 전자결재 시작 -->
  <div class="item">
  <div class="header">전자결재</div>
  <div class="menu">
      <a class="item" href="내 결재신청 페이지">
        내 결재 신청 페이지
      </a>
      <a class="item" href="내게온 결재 페이지">
        내게온 결재 페이지
      </a>
  </div>
</div>
<!-- 전자결재 끝 -->
<a class="item" href="사원검색페이지">사원검색</a>
<a class="item" href="인사평가페이지">인사평가</a>
<a class="item" href="재고관리페이지">재고관리</a>
<!-- 인사관리 시작 -->
<div class="item">
  <div class="header">인사관리</div>
  <div class="menu">
      <a class="item" href="권한부여페이지">
        권한부여
      </a>
      <a class="item" href="전체출결페이지">
        전체출결
      </a>
      <a class="item" href="인사평가결과페이지">
        인사평가결과
      </a>
      <a class="item" href="근태결재페이지">
        근태결재
      </a>
      <a class="item" href="부서관리페이지">
        부서관리
      </a>
      <a class="item" href="사원관리페이지">
        사원관리
      </a>
  </div>
</div>
<!-- 인사관리 끝 -->
<!-- 물품관리 시작 -->
<div class="item">
  <div class="header">물품관리</div>
  <div class="menu">
      <a class="item" href="./paygoods.jsp">		
        물품결재
      </a>
      <a class="item" href="./i_o.jsp">
        입출고관리
      </a>
      <a class="item" href="./account.jsp">
        거래처
      </a>
  </div>
</div>
<!-- 물품관리 끝 -->
<!-- 회계관리 시작 -->
<div class="item">
  <div class="header">회계관리</div>
  <div class="menu">
      <a class="item" href="./emp_Spending.jsp">
        사원지출관리
      </a>
      <a class="item" href="./dept_Spending.jsp">
        부서지출관리
      </a>
      <a class="item" href="비품지출관리페이지">
        비품지출관리
      </a>
      <a class="item" href="회사지출관리페이지">
        회사지출관리
      </a>
  </div>
</div>
<!-- 회계관리 끝 -->
</div>
<!-- 사이드메뉴 끝 -->