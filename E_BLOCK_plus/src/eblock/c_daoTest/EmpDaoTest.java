package eblock.c_daoTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import eblock.c_dao.EmpDao;

public class EmpDaoTest {
	
	public static void main(String[] args) {
		EmpDao eDao = new EmpDao();
		
		Map<String, Object> pMap = new HashMap<>();
		List<Map<String,Object>> rlist = null;
		int result = 0;

		//출결 조회하기 (달력용)
		pMap.put("e_no", 3);
		rlist = eDao.cmt_calendar(pMap);
		System.out.println(rlist);
		
		//퇴사신청처리하기(결재) (09/27)
//		pMap.put("rt_no", 3);
//		pMap.put("sign_rsn", "좋은 미래를 기도합니다.");
//		pMap.put("outcome", "rta-3");
//		result=eDao.retire_sign(pMap);
//		System.out.println(result);
		
		//퇴사신청처리하기(결재) (09/27)
//		pMap.put("rt_no", 3);
//		pMap.put("sign_rsn", "좋은 미래를 기도합니다.");
//		pMap.put("outcome", "rta-3");
//		result=eDao.retire_sign(pMap);
//		System.out.println(result);
		

		
		
		//퇴사신청내역 수정하기 (09/27)
//		pMap.put("rt_no",2);
//		pMap.put("ask_eno", 5);
//		pMap.put("outcome", "rta-0");
//		result=eDao.retire_askUpd(pMap);
//		System.out.println(result);
		
		//퇴사신청내역 조회하기 (09/26)
//		pMap.put("sign_eno", 3);
//		rlist = eDao.retire_list(pMap);
//		System.out.println(rlist);
		
		//퇴사신청하기 테스트 (09/26)
//		pMap.put("rt_date","2018-10-26");
//		pMap.put("outcome", "rta-1");
//		pMap.put("ask_rsn","퇴사신청테스트 실행");
//		pMap.put("ask_eno", 8);
//		pMap.put("sign_eno", 4);
//		result = eDao.retire_ask(pMap);
//		System.out.println(result);
		
		
		//부서배정/이동/권한부여 (09/25)
//		pMap.put("e_no", 5);
//		pMap.put("d_no", 1211);
//		pMap.put("au_no", 10);
//		result = eDao.cntr_setDeptAuth(pMap);
		
		
		//신규사원 등록하기 (09/23)
//		pMap.put("e_no", 0);
//		pMap.put("e_id", "asdfasdf");
//		pMap.put("e_pw", "qewr0000");
//		pMap.put("e_name", "데모");
//		pMap.put("e_jdate", "2018-09-27");
//		pMap.put("e_ph", "010-4444-7777");
//		pMap.put("e_email", "sdfgmsdfg@adf.com");
//		pMap.put("e_addr", "여기가 어딜까요??");
//		pMap.put("note1", "사원등록 비고");
//		pMap.put("e_bdate", "1992-02-14");
//		pMap.put("gender", "1");
//		pMap.put("e_rank", 10);
//		
//		pMap.put("cntr_date", "2018-09-27");
//		pMap.put("cntr_sort", "공채");
//		pMap.put("cntr_sal", 2600*10000);
//		pMap.put("cntr_sdate", "2018-09-27");
//		pMap.put("cntr_fdate", "2019-09-26");
//		pMap.put("note2", "신입 연봉협상했네요~");
//		
//		eDao.cntr_addEmp(pMap);
//		result = (int)pMap.get("result");
//		System.out.println(result);
		
		
		//출결 조회하기 : 부서 (09/23)
//		pMap.put("d_name", "본부");
//		rlist = eDao.cmt_deptList(pMap);
//		System.out.println(rlist.get(0).size());

		
		//출결 조회하기 : 개인 (09/23)
//		pMap.put("e_no",5);
//		rlist = eDao.cmt_myList(pMap);
//		System.out.println(rlist.get(0).size());
		
		//출결 체크하기 테스트 (09/23)
//		pMap.put("e_no", 5);
//		result = eDao.cmt_checkIn(pMap);
//		System.out.println("result : "+result);
		
		
		
		
		//인사평가 수정 테스트 (09/23)
//		pMap.put("ev_eno",3);
//		pMap.put("tg_eno",10);
//		pMap.put("ev_content","재판단.. 괜찮은 친구네 ");
//		pMap.put("ev_score",85);
//		
//		result = eDao.pev_upd(pMap);
//		System.out.println(result);

		
		//인사평가 수정 테스트 (09/23)
//		pMap.put("ev_eno",3);
//		pMap.put("tg_eno",10);
//		pMap.put("ev_content","재판단.. 괜찮은 친구네 ");
//		pMap.put("ev_score",85);
//		
//		result = eDao.pev_upd(pMap);
//		System.out.println(result);

		
		//인사평가 입력 테스트 (09/21)
//		pMap.put("ev_eno",3);
//		pMap.put("tg_eno",10);
//		pMap.put("ev_content","넌 좀 혼나야함");
//		pMap.put("ev_score",40);
//		
//		result = eDao.pev_add(pMap);
//		System.out.println(result);
		
		
		//인사평가 조회 테스트 (09/23)
//		pMap.put("ev_eno", 3);
//		pMap.put("min_qrtno", "18-3");
//		rlist = eDao.pev_myList(pMap);
		
		
		
		
		
		//사원개인정보 수정 테스트 (09/23)
//		pMap.put("e_no", 5);
//		pMap.put("e_ph", "010-9988-9898");
//		pMap.put("e_addr","어디든 살고있음");
//		result = eDao.info_persUpd(pMap);

		
		//사원개인정보 조회 테스트 (09/23)
//		pMap.put("e_no", 1);
//		rlist = eDao.info_persList(pMap);
			
		
		//사원정보조회 테스트 (09/23)
//		pMap.put("e_name", "김");
//		rlist = eDao.info_empList(pMap);
		
		
		
		
		
		//로그인하기 테스트 (09/23)
//		pMap.put("e_id","lantern");
//		pMap.put("e_pw","fp1026");
//		rlist = eDao.login_check(pMap);
//		System.out.println(rlist.get(0).size());
		
		
	}
}
