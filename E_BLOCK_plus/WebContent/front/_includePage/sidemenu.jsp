<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%	
	String Project_Root2 = request.getContextPath();
/* int i=0; i<cs.length; i++ */
Cookie[] cs = request.getCookies();
String e_name=null;
String e_no=null;
String au_no=null;

if(cs != null&& cs.length>0 ){
for(int i=0;i<cs.length;i++){
	if("c_ename".equals(cs[i].getName())){
		 e_name =cs[i].getValue();
	}
	else if(cs[i].getName().equals("c_eno")){
		e_no = cs[i].getValue();
	}
	else if(cs[i].getName().equals("c_auno")){
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
  <a class="item" href="/<%=Project_Root2 %>/front/main.jsp" id="sm_main">메인페이지</a>
  <!-- 메인페이지 끝 -->
  <!-- 마이페이지 시작 -->
  <div class="item" id="sm_mp">
 	<div class="header">마이페이지</div>
  	<div class="menu">
      <a class="item" id="sm_mp_mp" href="javascript:plist()">
        내 정보
      </a>
      
      <a class="item" href="javascript:mlist()" id="sm_mp_com">
        내 출퇴근 내역
      </a>
      
    </div>
</div>
<!-- 마이페이지 끝 -->
<!-- 전자결재 시작 -->
  <div class="item" id="sm_ap">
  <div class="header">전자결재</div>
  <div class="menu">
  	  <a class="item" href="<%=Project_Root2 %>/front/approval/approvalMain.jsp" id="sm_ap_form">
        결재신청
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/approval/approvalFromMe.jsp" id="sm_ap_fromme">
        내 결재 신청목록
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/attd/toMe/list.jsp" id="sm_ap_tome">
        내게온 결재목록
      </a>
  </div>
</div>
<!-- 전자결재 끝 -->
<a class="item" href="<%=Project_Root2 %>/front/search/search.jsp">사원검색</a>
<a class="item" href="<%=Project_Root2 %>/front/evaluation/insaList.jsp">인사평가</a>
<a class="item" href="<%=Project_Root2 %>/front/inventory/jaegoEmp.jsp">재고관리</a>
<!-- 인사관리 시작 -->
<div class="item" id="sm_persmanage">
  <div class="header">인사관리</div>
  <div class="menu">
      <a class="item" href="<%=Project_Root2 %>/front/emp/cmt/cmtDeptList.jsp" id="sm_persmanage_att">
        출결관리
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/AllPev.jsp" id="sm_persmanage_Eval">
        인사평가          
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/attdToMeList.jsp" id="sm_persmanage_aplist">
        근태결재내역
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/cntrSetDept.jsp" id="sm_persmanage_dept">
        부서관리
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/empList.jsp" id="sm_persmanage_emp">
        사원관리
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/persmanage/auth.jsp" id="sm_persmanage_auth">
        권한부여
      </a>
  </div>
</div>
<!-- 인사관리 끝 -->
<!-- 물품관리 시작 -->
<div class="item" id="sm_artcl">
  <div class="header">물품관리</div>
  <div class="menu">
      <a class="item" href="<%=Project_Root2 %>/front/article/paygoods.jsp" id="sm_artcl_ap">		
        입출고신청조회
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/article/i_o.jsp" id="sm_artcl_sar">
        비품구매신청조회
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/article/account.jsp" id="sm_artcl_acc">
        거래처
      </a>
  </div>
</div>
<!-- 물품관리 끝 -->
<!-- 회계관리 시작 -->
<div class="item" id="sm_acc">
  <div class="header">회계관리</div>
  <div class="menu">
      <a class="item" href="<%=Project_Root2 %>/front/bg/ex/deptList.jsp" id="sm_acc">
        부서별 예산할당
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/account/dept_Spending.jsp">
        부서별 예산집행
      </a>
      <a class="item" href="<%=Project_Root2 %>/front/account/goods_Spending.jsp">
        급여관리
      </a>
  </div>
</div>
<!-- 회계관리 끝 -->
</div>
<!-- 사이드메뉴 끝 -->
<!-- 사이드바 사용시 내용물은 pusher 속에 -->
<div class="pusher">

<form id="p_eno">
		 <input type="hidden" id="e_no" name="e_no" value="<%=e_no %>">
		  <input type="hidden" name="e_name" value="<%=e_name %>">
</form>

<script type="text/javascript">
function plist(){
	 $("#p_eno").attr("method","post"); 
	 $("#p_eno").attr("action","<%=Project_Root2 %>/emp/info/persList.ebp"); 
	 $("#p_eno").submit(); 
 }
function mlist(){
	 $("#p_eno").attr("method","post"); 
	 $("#p_eno").attr("action","<%=Project_Root2 %>/front/emp/cmt/myList.jsp"); 
	 $("#p_eno").submit(); 
} 
</script>
