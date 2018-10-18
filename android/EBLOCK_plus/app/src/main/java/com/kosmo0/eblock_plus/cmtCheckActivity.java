package com.kosmo0.eblock_plus;

import android.app.Activity;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.Socket;

import static java.lang.System.out;

public class cmtCheckActivity extends AppCompatActivity {
    private Socket socket;  //소켓생성
    BufferedReader in;      //서버로부터 온 데이터를 읽는다.
    PrintWriter out;        //서버에 데이터를 전송한다.
    private  String result_msg = "접속 실패";

    EditText editip = null;
    EditText editid = null;
    EditText editpw = null;
    @Override
    protected void onCreate(Bundle savedInstanceState) {


        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cmt_check);
    }
    public void onCheck(View view){
        editip = (EditText)findViewById(R.id.ipText);
        editid = (EditText)findViewById(R.id.idText);
        editpw = (EditText)findViewById(R.id.pwText);
        check();
        try{
            Thread.sleep(1000);

        }catch (InterruptedException e) {
            e.printStackTrace();
        }

        Toast msg = Toast.makeText(cmtCheckActivity.this, result_msg, Toast.LENGTH_SHORT);
        msg.show();

        Intent intent = new Intent(getApplicationContext(), attdActivity.class);
        intent.putExtra("result",result_msg);
        startActivity(intent);

    }
    private void check(){


        Thread worker = new Thread() {    //worker 를 Thread 로 생성
            public void run() { //스레드 실행구문
                String ip = editip.getText().toString();
                String id = editid.getText().toString();
                String pw = editpw.getText().toString();

                try {
                    //소켓을 생성하고 입출력 스트립을 소켓에 연결한다.
                    socket = new Socket(ip, 12223); //소켓생성
                    out = new PrintWriter(socket.getOutputStream(), true); //데이터를 전송시 stream 형태로 변환하여                                                                                                                       //전송한다.
                    in = new BufferedReader(new InputStreamReader(
                            socket.getInputStream())); //데이터 수신시 stream을 받아들인다.




                    out.println("1000|"+id+"|"+pw+"|"+ip);

                } catch (IOException e) {
                    e.printStackTrace();
                }

                //소켓에서 데이터를 읽어서 화면에 표시한다.
                try {
                    String data = null;
                    //while (in.readLine() != null) {
                    result_msg = in.readLine(); // in으로 받은 데이타를 String 형태로 읽어 data 에 저장




                    //}
                } catch (Exception e) {

                }finally{
                    try{
                        if(in != null)
                            in.close();
                        if(out != null)
                            out.close();
                        if(socket != null)
                            socket.close();
                    }catch(Exception ex){}
                }
            }
        };




        worker.start();  //onResume()에서 실행.
    }
}
