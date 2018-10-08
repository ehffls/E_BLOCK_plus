package util;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBinder {
	HttpServletRequest req = null;
	public CookieBinder(HttpServletRequest req) {
		this.req = req;
	}
	
	public void bind(Map<String,Object> pMap) {

		Cookie[] cs = req.getCookies();//요청객체로부터 전체쿠키 배열로 반환

		if(cs!=null)	{
			for(int i=0;i<cs.length;i++) {
				if(!"JSESSIONID".equals(cs[i].getName())) {
					pMap.put(cs[i].getName(),cs[i].getValue());
					System.out.println("cookie_name : "+cs[i].getName()+", values : "+cs[i].getValue());
				}
			}
		}
	}
}
