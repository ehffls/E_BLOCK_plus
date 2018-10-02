package eblock;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import eblock.a_controller.Controller;
import util.ControllerMapper;


public class FrontServlet extends HttpServlet {
	Logger logger = Logger.getLogger(FrontServlet.class);
	
	private void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("service호출성공");
		
		req.setCharacterEncoding("utf-8");
		res.setCharacterEncoding("utf-8");
		
		String requestURI = req.getRequestURI();//ex)/E_BLOCK_plus/front_no_arranged/JBH/account.jsp
		String contextPath = req.getContextPath();//ex)/E_BLOCK_plus
		String command = requestURI.substring(contextPath.length()+1);//ex)front_no_arranged/JBH/account.jsp
		logger.info("command : " + command);
		
		Controller controller = null;
		try {
			controller = ControllerMapper.getController(command);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//■■■■■■■■■■[ START|if : outter ]■■■■■■■■■■
		if(controller != null) {
			String[] pageMove = null;
			try {
				String returnString = controller.execute(req, res);
				//pageMove[0] 페이지 이동방식, pageMove[1] 목적페이지
				pageMove = returnString.split(":");//[forward|redirect]:XXX.jsp
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			//■■■■■■■■■■[ START|if : middle ]■■■■■■■■■■
			if(pageMove != null) {
				String path = "/front"+pageMove[1];
				//■■■■■■■■■■[ START|if : inner ]■■■■■■■■■■
				if("redirect".equals(pageMove[0])) { 
					res.sendRedirect(path);
				}
				else if("forward".equals(pageMove[0])){
					RequestDispatcher view = req.getRequestDispatcher(path);
					view.forward(req, res);
				}
				else {
					res.sendRedirect(contextPath+"/fail/pageMoveFail.jsp");
					logger.info("이동방식이 올바르지 않습니다. pageMove="+pageMove);
				}
				//■■■■■■■■■■[ END|if : inner ]■■■■■■■■■■
				
				logger.info("이동방식:"+pageMove[0]+", path:"+path);
				
			} else {
				logger.info("pageMove==null");
				res.sendRedirect(contextPath+"/fail/logicFail.jsp");
			}
			//■■■■■■■■■■[ END|if : middle ]■■■■■■■■■■
		} else {
			logger.info("control==null");
			res.sendRedirect(contextPath+"/fail/controlFail.jsp");
		}
		//■■■■■■■■■■[ END|if : outter ]■■■■■■■■■■
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doService(req,res);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doService(req,res);
	}
}
