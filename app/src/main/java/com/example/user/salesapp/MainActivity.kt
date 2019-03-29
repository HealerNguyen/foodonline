package com.example.user.salesapp

import android.content.Intent
import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.view.Window
import android.widget.Toast
import com.android.volley.Request
import com.android.volley.RequestQueue
import com.android.volley.Response
import com.android.volley.toolbox.StringRequest
import com.android.volley.toolbox.Volley
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.activity_reg.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        supportActionBar?.hide()

        login_signup.setOnClickListener {
            var i=Intent(this,RegAct::class.java)
            startActivity(i)
        }

        login_btn.setOnClickListener {
            if(login_password.text == null || login_mobile.text == null) {
                Toast.makeText(this,"Please enter information to login!", Toast.LENGTH_LONG).show()
            }
            var url = "http://127.0.0.1/SalesWeb/login.php?mobile=" + login_mobile.text.toString() + "&password=" +
                    login_password.text.toString()

            var rq: RequestQueue = Volley.newRequestQueue(this)
            var sr= StringRequest(Request.Method.GET,url, Response.Listener { response ->
                if(response.equals("0"))
                    Toast.makeText(this,"Login Fail", Toast.LENGTH_LONG).show()
                else
                {
                    UserInfo.mobile=login_mobile.text.toString()
                    var i=Intent(this,HomeAct::class.java)
                    startActivity(i)
                }

            }, Response.ErrorListener { error ->
                Toast.makeText(this,error.message, Toast.LENGTH_LONG).show()
            })

            rq.add(sr)
        }
    }
}
