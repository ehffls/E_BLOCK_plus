package com.kosmo0.eblock_plus;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class attdActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_attd);
        Intent intent = getIntent();
        String name= (String)intent.getSerializableExtra("result");

        TextView txtName = (TextView) findViewById(R.id.result);
        txtName.setText(name);
    }
}
