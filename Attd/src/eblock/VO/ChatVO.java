package eblock.VO;

import java.io.PrintWriter;
import java.util.ArrayList;

public class ChatVO {
	PrintWriter pw = null;
	int u_no = 0;
	
	ChatVO(PrintWriter pw, int u_no){
		this.pw = pw;
		this.u_no = u_no;
	}
}
