package eblock.a_controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.b_logic.EquipLogic;
import util.CookieBinder;
import util.HashMapBinder;

public class EquipController implements Controller {
	Logger logger = Logger.getLogger(EquipController.class);
	String work = null;
	String crud = null;
	EquipLogic equipLogic = null;

	public EquipController(String work, String crud) {
		this.work = work;
		this.crud = crud;
		equipLogic = new EquipLogic(crud);
	}

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		logger.info("excute 호출 성공, work:"+work+", crud:"+crud);

		Map<String,Object> pMap = new HashMap<String,Object>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		CookieBinder cb = new CookieBinder(req);
		cb.bind(pMap);

		String name = null;
		String path = null;
		Object robj = null;

		List<Map<String, Object>> list = null;
		int result = 0;
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		
		/* 비품분류관리 */
		
		if(work.equals("emp")) {
			//결재권 조회하기
			if(crud.equals("authList")) {
				robj = equipLogic.emp_authList(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//결재권자 조회하기
			else if(crud.equals("authlist")) {
				robj = equipLogic.emp_authorList(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("sort")) {
			//[결재권자]
			//비품분류 등록하기
			if(crud.equals("add")) {
				result = equipLogic.sort_add(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//[결재권자]
			//등록된 비품분류 수정하기 
			else if(crud.equals("upd")) {
				result = equipLogic.sort_upd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//[결재권자]
			//등록된 비품분류 삭제하기 
			else if(crud.equals("del")) {
				result = equipLogic.sort_del(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//등록된 비품분류 조회하기 
			else if(crud.equals("list")) {
				robj = equipLogic.sort_list(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		
		/* 구매가능비품내역추가 */
		
		else if(work.equals("add")) {
			//비품추가신청내역에 새로운 비품내역추가 신청하기 
			if(crud.equals("ask")) {
				result = equipLogic.add_ask(pMap);
				name ="addAsk";
				path="forward:xxx.jsp";
			}
			//대기중인 비품내역추가신청 수정하기
			else if(crud.equals("askUpd")) {
				result = equipLogic.add_askUpd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//비품추가신청내역 조회하기
			else if(crud.equals("askList")) {
				robj = equipLogic.add_askList(pMap);
				name ="rList";
				path="forward:/equip/add/askList_JSON.jsp";
			}
			//[결재권자]
			//비품추가신청내역에 새로운 비품내역 추가신청 결재하기
			else if(crud.equals("sign")) {
				result = equipLogic.add_sign(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//[결재권자]
			//(신청가능)비품테이블에서 비품 조회하기
			else if(crud.equals("equipList")) {
				robj = equipLogic.add_equipList(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//[결재권자]
			//(신청가능)비품테이블에 비품가격 수정하기
			else if(crud.equals("equipCost")) {
				result = equipLogic.add_equipCost(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//추가 비품 신청
			else if(crud.equals("newArticleAsk")) {
				robj = equipLogic.newArticleAsk(pMap);
				logger.info("여기");
				name ="newAA";
				path="forward:/equip/add/newArticleAsk.jsp";
			}
	
			
		}
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		
		/* 거래처관리 */
		
		else if(work.equals("mk")) {
			//[결재권자]
			//거래처 등록하기 
			if(crud.equals("add")) {
				result = equipLogic.mk_add(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//[결재권자]
			//등록된 거래처 수정하기 
			else if(crud.equals("upd")) {
				result = equipLogic.mk_upd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//거래처 조회하기 
			else if(crud.equals("list")) {
				robj = equipLogic.mk_list(pMap);
				name ="rList";
				path="forward:/equip/mk/list_JSON.jsp";
			}
		}
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		
		/* 비품구매 */
		
		else if(work.equals("purc")) {
			//구매가능내역에서 비품구매 신청하기
			if(crud.equals("ask")) {
				robj = equipLogic.purc_ask(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//구매가능내역에서 비품구매 신청 수정하기 (취소포함)
			else if(crud.equals("askUpd")) {
				result = equipLogic.purc_askUpd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//비품구매신청내역 조회하기
			else if(crud.equals("askList")) {
				robj = equipLogic.purc_askList(pMap);
				name ="rList";
				path="forward:/equip/purc/askList_JSON.jsp";
			}
			//[결재권자]
			//비품구매신청내역 결재하기
			else if(crud.equals("sign")) {
				result = equipLogic.purc_sign(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:/equip/purc/askList.jsp";//페이지 새로고침하고자함
			}
		}
		
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		
		/* 비품입고처리 및 입고비품관리 */
		
		else if(work.equals("inb")) {
			//입고비품내역에서 입출가능한 비품 조회하기
			if(crud.equals("eqList")) {
				robj = equipLogic.inb_eqList(pMap);
				name ="addAskList_2";
				path="forward:/equip/add/addAskList_JSON2.jsp";
			}
			//비품입출신청내역에 비품입출 신청하기
			else if(crud.equals("ask")) {
				result = equipLogic.inb_ask(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//비품입출신청내역에서 신청 수정하기(취소포함)
			else if(crud.equals("askUpd")) {
				result = equipLogic.inb_askUpd(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//[결재권자]
			//비품입출신청내역의 신청 결재하기 (기각|승인)
			else if(crud.equals("askList")) {
				robj = equipLogic.inb_askList(pMap);
				name ="rList";
				path="forward:/equip/inb/askList_JSON.jsp";
			}
			//[결재권자]
			//비품입출신청내역의 신청 결재하기 (기각|승인)
			else if(crud.equals("sign")) {
				result = equipLogic.inb_sign(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
			//[결재권자]
			//입고비품상태관리 프로시저로 처리하기 (수리반출|반입완료|폐기)
			else if(crud.equals("change")) {
				result = equipLogic.inb_change(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■
		
		/* 조회 */
		
		else if(work.equals("ask")) {
			//내가 신청한 결재내역 조회하기 (비품구매 | 비품반출 2종)
			if(crud.equals("list")) {
				robj = equipLogic.ask_list(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}
		else if(work.equals("sign")) {
			//내가 신청받은 결재요청 조회하기 (조건: 대기|승인|기각)
			if(crud.equals("list")) {
				robj = equipLogic.sign_list(pMap);
				name ="attribute의 name redirect면 안씀";
				path="forward:xxx.jsp";
			}
		}

//■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■■

		req.setAttribute(name, robj);

		return path;
	}

}
