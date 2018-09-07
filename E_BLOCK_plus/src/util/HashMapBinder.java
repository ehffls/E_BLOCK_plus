package util;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class HashMapBinder {
		HttpServletRequest req = null;
		//첨부파일 처리에 필요한 변수 선언
		MultipartRequest multi = null;
		String realFolder = "";
		//첨부파일 한글처리
		String encType = "utf-8";
		
		
		//첨부파일의 크기      -------------------------------------정해야함-------------------------
		int maxSize = 5*1024*1024;//5MB
		
		public HashMapBinder(HttpServletRequest req) {
			this.req = req;
			//첨부파일이 실제로 배포될 물리적인 위치 -
			realFolder = "C:\\git\\E_BLOCK_plus\\E_BLOCK_plus\\WebContent\\attached";
		}
		//첨부파일이 있는 경우 등록할 때 사용자가 입력한 값을 pMap에 답기
		public void multiBind(Map<String,Object> pMap) {
			pMap.clear();
			try {
				multi = new MultipartRequest(req, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			} catch (IOException e) {
				e.printStackTrace();
			}
			Enumeration<String> en = multi.getParameterNames();
			while(en.hasMoreElements()) {
				String key = en.nextElement();
				pMap.put(key, multi.getParameter(key));
			}
			//첨부파일에 대한 정보를 받아오는 코드 추가
			Enumeration<String> files = multi.getFileNames();
			//이렇게 읽어온 파일이름을 객체로 만들어준다.
			File file = null;
			while(files.hasMoreElements()) {
				String fname = files.nextElement();
				String filename = multi.getFilesystemName(fname);
				pMap.put("b_file", filename);
				//file객체 생성하기 -> 왜냐하면 첨부파일의 크기를 알고 싶어요....
				file = multi.getFile(fname);
			}
			//첨부파일의 크기를 담을 수 있는 변수
			double size = 0;
			if(file != null) {
				size = file.length();//파일 크기가 저장 5.2MB
				size = size/(1024*1024);
				pMap.put("b_size", size);
			}
			
		}
		public void bind(Map<String,Object> pMap) {
			pMap.clear();
			Enumeration<String> en = req.getParameterNames();
			while(en.hasMoreElements()) {
				String key = en.nextElement();
				pMap.put(key, req.getParameter(key));
			}
		}
}
