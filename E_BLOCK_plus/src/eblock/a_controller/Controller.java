package eblock.a_controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Controller {
	/*******************************
	 * 모든 Controller가 구현해야하는 Interface
	 * @param req
	 * @param res
	 * @return String - ex)forward:XXX.jsp | redirect:XXX.jsp
	 * @throws Exception - 디버깅에 용이하도록 계획
	 *******************************/
	public String execute(HttpServletRequest req, HttpServletResponse res) throws Exception;
}

