<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계약 변경</title>
<%@ include file="/0_src/_includeList/commonUI_S.jsp"%>
<script src="/E_BLOCK_plus/0_src/js/table/datatables.js"></script>
<style>
	.ui.disabled.input{
		opacity:1;
	}
</style>
</head>
<body>

	<!--=============== 작성부분 ===============-->
	<%
		String targetName = "cntr_list";//여기에 request객체에 담은 리스트의 name을 쓰세요
		List<Map<String, Object>> list = (List<Map<String, Object>>) request.getAttribute(targetName);

		int    e_no       = 0; //사원번호    
		int    d_no       = 0; //부서번호    
		String e_id	      = ""; //아이디	   
		String e_pw	      = ""; //비밀번호	   
		String e_name     = ""; //사원이름    
		String e_jdate    = ""; //입사일자    
		int    au_no      = 0; //권한번호    
		String e_ph	      = ""; //사원연락처	
		String e_email	  =""; //사원이메일	
		String note1     = ""; //사원비고    
		String e_addr	  =""; //사원주소	   
		String e_bdate	  =""; //생년월일	   
		String gender	  =""; //성별 	   
		int    e_rank     = 0; //계약직급    

		String cntr_date  = ""; //계약일자    
		String cntr_sort  = ""; //계약분류    
		String cntr_sal   = ""; //계약연봉    
		String cntr_sdate = ""; //계약시작일자   
		String cntr_fdate = ""; //계약종료일자   
		String note2  = ""; //계약비고    

		if (list != null && list.size() > 0) {
			e_no       = Integer.parseInt(list.get(0).get("e_no").toString()); 
			e_name     = list.get(0).get("e_name").toString();
			e_id	   = list.get(0).get("e_id").toString();  
			e_pw	   = list.get(0).get("e_pw").toString();  
			e_ph	   = list.get(0).get("e_ph").toString();  
			e_email	   = list.get(0).get("e_email").toString();
			e_addr	   = list.get(0).get("e_addr").toString();
			e_bdate	   = list.get(0).get("e_bdate").toString();
			gender	   = list.get(0).get("gender").toString();
			d_no       = Integer.parseInt(list.get(0).get("d_no").toString()); 
			e_jdate    = list.get(0).get("e_jdate").toString();
			au_no      = Integer.parseInt(list.get(0).get("au_no").toString()); 
			note1      = list.get(0).get("e_note").toString();
			cntr_date  = list.get(0).get("cntr_date").toString();
			cntr_sort  = list.get(0).get("cntr_sort").toString();
			cntr_sal   = list.get(0).get("cntr_sal").toString();
			cntr_sdate = list.get(0).get("cntr_sdate").toString();
			cntr_fdate = list.get(0).get("cntr_fdate").toString();
			e_rank     = Integer.parseInt(list.get(0).get("e_rank").toString()); 
			note2  = list.get(0).get("cntr_note").toString();
		}
		
	%>

	<!--▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ emp_modal 시작  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒-->

	<div class="ui small modal" id="emp_modal">
		<div class="ui container">
			<form class="ui form" id="emp_form" style="margin-top: 10px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px;">
				<h4 class="ui dividing header">사원 계약 변경</h4>
				<div class="three fields">
					<div class="field">
						<label>이름</label>
						<div class="field">
							<div class="ui disabled input">
								<input id="emp_ename" onfocus="this.blur()" name="e_name" placeholder="이름" value="<%=e_name%>">
							</div>
						</div>
					</div>
					<div class="field">
						<label>사원 번호</label>
						<div class="field">
							<div class="ui disabled input">
								<input id="emp_eno" name="e_no" placeholder="사원번호" value="<%=e_no%>">
							</div>

						</div>
					</div>
					<div class="field">
						<label>계약직급</label>
						<div class="ui selection dropdown">
							<input type="hidden" name="e_rank" value="<%=e_rank%>">
							<i class="dropdown icon"></i>
							<div class="text"><%=e_rank%></div>
							<div class="menu">
								<div class="item" data-value="10">10(사원)</div>
								<div class="item" data-value="20">20(팀장)</div>
								<div class="item" data-value="30">30(과장)</div>
								<div class="item" data-value="40">40(부서장)</div>
								<div class="item" data-value="50">50(대표이사)</div>
							</div>
						</div>
					</div>
				</div>
				<div class="three fields">
					<div class="field">
						<label>계약일자</label>
						<div class="ui calendar" id="emp_cday">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" id="emp_cdate" name="cntr_date" placeholder="계약일자" value="<%=cntr_date%>" />
							</div>
						</div>
					</div>
					<div class="field">
						<label>계약분류</label>
 					<div class="ui selection dropdown">
							<input type="hidden" name="cntr_sort" value="<%=cntr_sort%>">
							<i class="dropdown icon"></i>
							<div class="text"><%=cntr_sort%></div>
							<div class="menu">
								<div class="item" data-value="만료">만료</div>
								<div class="item" data-value="협상">협상</div>
								<div class="item" data-value="특채">특채</div>
								<div class="item" data-value="공채">공채</div>
							</div>
						</div> 
					</div>
					<div class="field">
						<label>계약연봉</label>
						<input type="text" id="emp_csal" name="cntr_sal" placeholder="계약연봉" value="<%=cntr_sal%>">
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>계약시작일</label>
						<div class="ui calendar" id="emp_cstart">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" id="emp_csdate" name="cntr_sdate" placeholder="계약시작일" value="<%=cntr_sdate%>" />
							</div>
						</div>
					</div>
					<div class="field">
						<label>계약종료일</label>
						<div class="ui calendar" id="emp_cend">
							<div class="ui input left icon">
								<i class="calendar icon"></i>
								<input type="text" id="emp_date" name="cntr_fdate" placeholder="계약종료일" value="<%=cntr_fdate%>" />
							</div>
						</div>
					</div>
				</div>
				<div class="field">
					<label>비고</label>
					<input type="text" id="emp_note" name="note2" placeholder="비고" value="<%=note2%>">
				</div>
								
				<input type="hidden" name="e_id" value="<%=e_id%>" />
				<input type="hidden" name="e_pw" value="<%=e_pw%>" />
				<input type="hidden" name="e_ph" value="<%=e_ph%>" />
				<input type="hidden" name="e_email" value="<%=e_email%>" />
				<input type="hidden" name="e_addr" value="<%=e_addr%>" />
				<input type="hidden" name="e_bdate" value="<%=e_bdate%>" />
				<input type="hidden" name="gender" value="<%=gender%>" />
				<input type="hidden" name="d_no" value="<%=d_no%>" />
				<input type="hidden" name="e_jdate" value="<%=e_jdate%>" />
				<input type="hidden" name="au_no" value="<%=au_no%>" />
				<input type="hidden" name="note1" value="<%=note1%>" />
				
				<div align="center">
					<a href="javascript:emp_updata('<%=e_no%>')" class="ui teal button">등록</a>
					<div class="ui grey button" onclick="emp_bcencel()">취소</div>
				</div>
			</form>
		</div>
	</div>


	<script type="text/javascript">
	
		function emp_bcencel() {
			$('.ui.modal').modal('hide');
		};
	
		$('.dropdown').dropdown();
	
		//캘린더 설정
	
		$(function() { //계약일
			$('#emp_cday').calendar({
				type : 'date'
			});
		});
	
		$(function() { //계약 시작일, 계약 종료일
			$('#emp_cstart').calendar({
				type : 'date',
				endCalendar : $('#emp_cend')
			});
			$('#emp_cend').calendar({
				type : 'date',
				startCalendar : $('#emp_cstart')
			});
		});
	</script>

	<!--▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ emp_modal 끝  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒-->


	<!--▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ dept modal시작  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒-->

	<div class="ui small modal" id="dept_modal">
		<div class="ui container">
			<form class="ui form" id="dept_form" style="margin-top: 10px; margin-left: 10px; margin-right: 10px; margin-bottom: 10px;">
				<h4 class="ui dividing header">부서 배정 & 수정</h4>
				<div class="two fields">
					<div class="field">
						<label>이름</label>
						<div class="ui disabled input">
							<input type="text" onfocus="this.blur()" id="dept_ename" name="e_name" placeholder="이름" value="<%=e_name%>">
						</div>
					</div>
					<div class="field">
						<label>사원 번호</label>
						<div class="ui disabled input">
							<input type="text" id="dept_eno" name="e_no" placeholder="사원 번호" value="<%=e_no%>">
						</div>
					</div>
				</div>
				<div class="two fields">
					<div class="field">
						<label>부서번호</label>
						<div class="ui selection dropdown">
							<input type="hidden" name="d_no" value="<%=d_no%>">
							<i class="dropdown icon"></i>
							<div class="text"><%=d_no%></div>
							<div class="menu">
								<div class="item" data-value="1000">본부</div>
								<div class="item" data-value="1101">재무부</div>
								<div class="item" data-value="1200">사업부</div>
								<div class="item" data-value="1211">영업1팀</div>
								<div class="item" data-value="1212">영업2팀</div>
								<div class="item" data-value="1221">운영1팀</div>
								<div class="item" data-value="1222">운영2팀</div>
								<div class="item" data-value="1231">마케팅팀</div>
								<div class="item" data-value="1241">인사팀</div>
								<div class="item" data-value="1242">인사채용팀</div>
								<div class="item" data-value="1300">개발부</div>
								<div class="item" data-value="1311">개발1팀</div>
								<div class="item" data-value="1312">개발2팀</div>
								<div class="item" data-value="1313">개발3팀</div>
								<div class="item" data-value="1314">개발4팀</div>
								<div class="item" data-value="1400">디자인기획부</div>
								<div class="item" data-value="1411">제품디자인팀</div>
								<div class="item" data-value="1421">디자인기획부</div>
								<div class="item" data-value="1431">그래픽디자인팀</div>
								<div class="item" data-value="8001">비품관리팀</div>
								<div class="item" data-value="9001">운영지원팀</div>
							</div>
						</div>
					</div>
					<div class="field">
						<label>권한 번호</label>
						<div class="ui selection dropdown">
							<input type="hidden" name="au_no" value="<%=au_no%>">
							<i class="dropdown icon"></i>
							<div class="text"><%=au_no%></div>
							<div class="menu">
								<div class="item" data-value="25">근태신청 승인권한</div>
								<div class="item" data-value="35">비품추가신청 승인권한</div>
								<div class="item" data-value="36">비품구매신청 승인권한</div>
								<div class="item" data-value="37">비품입출신청 승인권한</div>
								<div class="item" data-value="38">비품별도추가 권한</div>
								<div class="item" data-value="39">비품상태관리및폐기 권한</div>
								<div class="item" data-value="43">예산집행 권한</div>
								<div class="item" data-value="99">최고관리자 권한</div>
							</div>
						</div>
					</div>
				</div>
				<div class="field">
					<label>비고</label>
					<input type="text" id="dept_dnote" name="note1" placeholder="비고" value="<%=note1%>">
				</div>
				
				<input type="hidden" name="e_id" value="<%=e_id%>" />
				<input type="hidden" name="e_pw" value="<%=e_pw%>" />
				<input type="hidden" name="e_jdate" value="<%=e_jdate%>" />
				<input type="hidden" name="e_ph" value="<%=e_ph%>" />
				<input type="hidden" name="e_email" value="<%=e_email%>" />
				<input type="hidden" name="e_addr" value="<%=e_addr%>" />
				<input type="hidden" name="e_bdate" value="<%=e_bdate%>" />
				<input type="hidden" name="gender" value="<%=gender%>" />
				<input type="hidden" name="e_rank" value="<%=e_rank%>" />
				
				<input type="hidden" name="cntr_date" value="<%=cntr_date%>" />
				<input type="hidden" name="cntr_sort" value="<%=cntr_sort%>" />
				<input type="hidden" name="cntr_sal" value="<%=cntr_sal%>" />
				<input type="hidden" name="cntr_sdate" value="<%=cntr_sdate%>" />
				<input type="hidden" name="cntr_fdate" value="<%=cntr_fdate%>" />
				<input type="hidden" name="note2" value="<%=note2%>" />
				
				<div align="center">
					<a class="ui teal button" href="javascript:dept_updata('<%=e_no%>')" >등록</a>
					<div class="ui grey button" onclick="dept_bcencel()">취소</div>
				</div>
			</form>
		</div>
	</div>


	<script type="text/javascript">
	
		function dept_bcencel() {
			$('.ui.modal').modal('hide');
		};
		
		
	</script>

	<!--▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒ dept modal 끝 ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒-->


	<!--=============== 작성부분 ===============-->



</body>
</html>