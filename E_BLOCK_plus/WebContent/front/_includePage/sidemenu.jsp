<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
   String Project_Root2 = request.getContextPath();
   /* int i=0; i<cs.length; i++ */
   Cookie[] cs = request.getCookies();
   String e_name = null;
   String e_no = null;
   String au_no = null;

   if (cs != null && cs.length > 0) {
      for (int i = 0; i < cs.length; i++) {
         if ("c_ename".equals(cs[i].getName())) {
            e_name = cs[i].getValue();
         } else if (cs[i].getName().equals("c_eno")) {
            e_no = cs[i].getValue();
         } else if (cs[i].getName().equals("c_auno")) {
            au_no = cs[i].getValue();
         }

      }
   }
%>

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
      $(".sidemenu_icon").click(function(){
          $("#sidebar").sidebar('setting', 'transition', 'overlay')
          .sidebar('toggle');
       });
      $(".accordion.menu").accordion();
 
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
   <a class="item" href="<%=Project_Root2%>/emp/cmt/myList.jsp" id="sm_main">메인페이지</a>
   <!-- 메인페이지 끝 -->
   <!-- 메인페이지 시작 -->
   <%-- <a class="item" href="<%=Project_Root2%>" id="sm_search">부서/사원검색</a> --%>
   <!-- 메인페이지 끝 -->
   <!-- 나의전자결재 시작 -->
   <div class="item" id="sm_fromMe">
      <div class="header">나의전자결재</div>
      <div class="ui vertical inverted accordion menu">
         <a class="item" href="<%=Project_Root2%>" id="sm_fromMe_attd"> 근태관련 </a>
         <a class="item" href="<%=Project_Root2%>" id="sm_fromMe_retire"> 사직관련 </a>
         <div class="item">
            <a class="active title" id="sm_fromMe_equip"> 비품관련 </a>
            <div class="active content">
               <a class="item" href="<%=Project_Root2%>/equip/add/addAskList.jsp" id="sm_fromMe_equipC"> 비품관련 신청 </a>      
               <a class="item" href="<%=Project_Root2%>" id="sm_fromMe_equipR"> 내 신청 조회 </a>      
            </div>
         </div>
      </div>
   </div>
   <!-- 전자결재 끝 -->
   <!-- 내게온전자결재 시작 -->
   <div class="item" id="sm_toMe">
      <div class="header">내게온전자결재</div>
      <div class="menu">
         <a class="item" href="<%=Project_Root2%>/attd/toMe/list.jsp" id="sm_toMe_attd"> 근태관련 </a>
         <a class="item" href="<%=Project_Root2%>/emp/retire/list.jsp" id="sm_toMe_retire"> 사직관련 </a>
         <a class="item" href="<%=Project_Root2%>/equip/add/askList.jsp" id="sm_toMe_equip"> 비품관련 </a>
      </div>
   </div>
   <!-- 전자결재 끝 -->
   <!-- 인사평가 시작 -->
   <a class="item" href="<%=Project_Root2%>" id="sm_pev">인사평가</a>
   <!-- 인사평가 끝 -->
   <!-- 인사관리 시작 -->
   <div class="item" id="sm_emp">
      <div class="header">인사관리</div>
      <div class="menu">
         <a class="item" href="<%=Project_Root2%>" id="sm_emp_cmt"> 출결관리 </a>
         <a class="item" href="<%=Project_Root2%>" id="sm_emp_pev"> 인사평가결과 </a>
         <a class="item" href="<%=Project_Root2%>" id="sm_emp_dept"> 부서/사원관리 </a>
      </div>
   </div>
   <!-- 인사관리 끝 -->
   <!-- 물품관리 시작 -->
   <div class="item" id="sm_equip">
      <div class="header">비품관리</div>
      <div class="menu">
         <a class="item" href="<%=Project_Root2%>" id="sm_equip_add"> 입고비품관리 </a>
         <a class="item" href="<%=Project_Root2%>/equip/all/list.jsp" id="sm_equip_buy"> 비품분류|거래처 </a>
      </div>
   </div>
   <!-- 물품관리 끝 -->
<%--    <!-- 회계관리 시작 -->
   <div class="item" id="sm_bg">
      <div class="header">회계관리</div>
      <div class="menu">
         <a class="item" href="<%=Project_Root2%>" id="sm_bg_1"> 부서별 예산할당 </a>
         <a class="item" href="<%=Project_Root2%>" id="sm_bg_2"> 부서별 예산집행 </a>
         <a class="item" href="<%=Project_Root2%>" id="sm_bg_2"> 급여관리 </a>
      </div>
   </div>
   <!-- 회계관리 끝 --> --%>
</div>
<!-- 사이드메뉴 끝 -->
<!-- 사이드바 사용시 내용물은 pusher 속에 -->
<div class="pusher">