package eblock.login;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.SQLException;
import java.util.HashMap;

import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;

import eblock.VO.ChatVO;
import eblock.dao.ChatDAO;

public class LoginServer {
	JTextArea jta = new JTextArea();
	public LoginServer() {
		ChatDAO cDAO = new ChatDAO();
		HashMap<Integer, ChatVO> hm = new HashMap<>();
		initDisplay();
		try{
			ServerSocket server = new ServerSocket(5555);
			jta.append("[LoginServer]시작\n");
			while(true){
				Socket sock = server.accept();
				jta.append(sock.getInetAddress().getHostAddress()+"[Login]접속\n");

				LoginServerThread loginthread = new LoginServerThread(sock,cDAO,jta,hm);
				loginthread.start();
			}
		}catch(IOException e){
			System.out.println(e);
		}finally {
			try {
				cDAO.con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	void initDisplay() {
		JFrame jf = new JFrame("LoginServer");
		jf.setSize(400, 400);
		jf.setDefaultCloseOperation(jf.EXIT_ON_CLOSE);
		jf.setVisible(true);
		JScrollPane jsp = new JScrollPane(jta, JScrollPane.VERTICAL_SCROLLBAR_AS_NEEDED, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
		jf.add(jsp);
	}
	
	public static void main(String[] args) {
		new LoginServer();
	}
}
