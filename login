package com.example.week9

import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)


        val edtEmail : EditText = findViewById(R.id.edtEmail)
        val edtPassword : EditText = findViewById(R.id.edtPassword)
        val btnLogin : Button = findViewById(R.id.btnLogin)
        val txtDisplay : TextView = findViewById(R.id.txtDisplay)


        val fixedUsername = "Emmanuel"
        val fixedPassword = "hello"

        val sp = getSharedPreferences("Friendly_app_three", Context.MODE_PRIVATE)
        val editor = sp.edit()

        btnLogin.setOnClickListener(){
            val strEmail = edtEmail.text.toString()
            val strPassword = edtPassword.text.toString()

            if (strEmail.isEmpty() or strPassword.isEmpty()){
                txtDisplay.text = "Empty Field"

            }else{
                if (strEmail == fixedUsername && strPassword == fixedPassword){

                    editor.putString("username", strEmail)
                    editor.putBoolean("isLoggedIn", true);
                    editor.apply()
                    txtDisplay.text = "Successfully logged in"
                }else{
                    txtDisplay.text = "wrong Email/Password Combination"
                }
            }
        }




    }
}
