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
  <a class="item" href="메인페이지" id="sm_main">메인페이지</a>
  <!-- 메인페이지 끝 -->
  <!-- 마이페이지 시작 -->
  <div class="item" id="sm_mp">
 	<div class="header">마이페이지</div>
  	<div class="menu">
      <a class="item" href="내 정보 페이지" id="sm_mp_mp">
        내 정보
      </a>
      <a class="item" href="내 출퇴근 내역 페이지" id="sm_mp_com">
        내 출퇴근 내역
      </a>
    </div>
</div>
<!-- 마이페이지 끝 -->
<!-- 전자결재 시작 -->
  <div class="item" id="sm_ap">
  <div class="header">전자결재</div>
  <div class="menu">
  	  <a class="item" href="내 결재신청 페이지" id="sm_ap_form">
        결재신청
      </a>
      <a class="item" href="내 결재신청 페이지" id="sm_ap_fromme">
        내 결재 신청목록
      </a>
      <a class="item" href="내게온 결재 페이지" id="sm_ap_tome">
        내게온 결재목록
      </a>
  </div>
</div>
<!-- 전자결재 끝 -->
<a class="item" href="사원검색페이지">사원검색</a>
<a class="item" href="인사평가페이지">인사평가</a>
<a class="item" href="재고관리페이지">재고관리</a>
<!-- 인사관리 시작 -->
<div class="item" id="sm_persmanage">
  <div class="header">인사관리</div>
  <div class="menu">
      <a class="item" href="전체출결페이지" id="sm_persmanage_att">
        전체출결
      </a>
      <a class="item" href="인사평가결과페이지" id="sm_persmanage_Eval">
        인사평가결과
      </a>
      <a class="item" href="근태결재페이지" id="sm_persmanage_aplist">
        근태결재내역
      </a>
      <a class="item" href="부서관리페이지" id="sm_persmanage_dept">
        부서관리
      </a>
      <a class="item" href="사원관리페이지" id="sm_persmanage_emp">
        사원관리
      </a>
  </div>
</div>
<!-- 인사관리 끝 -->
<!-- 물품관리 시작 -->
<div class="item" id="sm_artcl">
  <div class="header">물품관리</div>
  <div class="menu">
      <a class="item" href="./paygoods.jsp" id="sm_artcl_ap">		
        물품결재내역
      </a>
      <a class="item" href="./i_o.jsp" id="sm_artcl_sar">
        입출고관리
      </a>
      <a class="item" href="./account.jsp" id="sm_artcl_acc">
        거래처
      </a>
  </div>
</div>
<!-- 물품관리 끝 -->
<!-- 회계관리 시작 -->
<div class="item" id="sm_acc">
  <div class="header">회계관리</div>
  <div class="menu">
      <a class="item" href="사원지출관리페이지" id="sm_acc">
        사원지출관리
      </a>
      <a class="item" href="./dept_Spending.jsp">
        부서지출관리
      </a>
      <a class="item" href="./goods_Spending.jsp">
        비품지출관리
      </a>
      <a class="item" href="./com_Spending.jsp">
        회사지출관리
      </a>
  </div>
</div>
<!-- 회계관리 끝 -->
</div>
<!-- 사이드메뉴 끝 -->
<!-- 사이드바 사용시 내용물은 pusher 속에 -->
<div class="pusher">
