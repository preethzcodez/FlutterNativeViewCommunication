package com.example.native_view_communication

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.TextView

class ActivityOne : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_one)

        val argMessage = this.intent.getStringExtra("msg")
        val messageTextView: TextView = findViewById(R.id.tv_msg)
        messageTextView.text = argMessage
    }

    fun switchViewClick(v: View) {
        val intent = Intent()
        intent.putExtra("msg", this.intent.getStringExtra("msg"))
        intent.putExtra("RESULT", "SWITCH_VIEW_SECOND")
        setResult(RESULT_OK, intent)
        finish()
        overridePendingTransition(0, 0)
    }

    fun successClick(v: View) {
        val intent = Intent()
        intent.putExtra("RESULT", "SUCCESS MESSAGE : Activity One")
        setResult(RESULT_OK, intent)
        finish()
    }

    fun errorClick(v: View) {
        val intent = Intent()
        intent.putExtra("ERROR_CODE", "ERROR MESSAGE : Activity One")
        setResult(RESULT_CANCELED, intent)
        finish()
    }
}