package eblock.login;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.util.HashMap;
import java.util.StringTokenizer;

import javax.swing.JTextArea;

import eblock.VO.ChatVO;
import eblock.VO.LoginVO;
import eblock.dao.ChatDAO;
import eblock.protocol.Protocol;


public class LoginServerThread extends Thread {
	Socket sock = null;
	private BufferedReader br;
	private PrintWriter pw;
	ChatDAO cDAO;
	JTextArea jta;
	HashMap<Integer, ChatVO> hm;

	LoginServerThread(Socket sock, ChatDAO cDAO, JTextArea jta, HashMap<Integer, ChatVO> hm){
		this.sock = sock;
		this.cDAO = cDAO;
		this.jta = jta;
		this.hm = hm;
		try {
			pw = new PrintWriter(new OutputStreamWriter(sock.getOutputStream()));
			br = new BufferedReader(new InputStreamReader(sock.getInputStream()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void run(){
		try{
			String line = null;
			InetAddress inetAddress = sock.getInetAddress();
			while((line = br.readLine())!= null){
				StringTokenizer st = new StringTokenizer(line, "|");
				int protocol = Integer.parseInt(st.nextToken());
				logprint("["+inetAddress.getHostAddress()+"]"+protocol+"\n");
				
				switch (protocol) {
				case Protocol.Login:{
					String email = st.nextToken();
					String pasword = st.nextToken();
					LoginVO lvo = null;
					lvo = cDAO.login(email, pasword);

					if(lvo.login_success) {
						//if(!hm.containsKey(lvo.u_no)) {
							pw.println(lvo.res_msg);
							pw.flush();
						/*} else {
							pw.println(Protocol.Login_Fail+"|logining");
							pw.flush();
						}*/
					} else {
						pw.println(lvo.res_msg);
						pw.flush();
					}
					break;}
				case Protocol.attd_check:{
					
					break;}
				}
			}
		}catch(Exception e){
			e.printStackTrace();   
		}finally{
			logprint(sock.getInetAddress().getHostAddress()+"[login]종료\n");
			try{
				if(br != null)
					br.close();
				if(pw != null)
					pw.close();
				if(sock != null)
					sock.close();
			}catch(Exception ex){}
		}
	}
	void logprint(String msg) {
		jta.append(msg);
		jta.setCaretPosition(jta.getDocument().getLength());
	}
}
