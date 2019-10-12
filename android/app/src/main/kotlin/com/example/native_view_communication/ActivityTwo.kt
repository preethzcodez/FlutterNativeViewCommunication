package com.example.native_view_communication

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.TextView

class ActivityTwo : Activity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_two)
    }

    fun switchViewClick(v: View) {
        val intent = Intent()
        intent.putExtra("msg", this.intent.getStringExtra("msg"))
        intent.putExtra("RESULT", "SWITCH_VIEW_FIRST")
        setResult(RESULT_OK, intent)
        finish()
        overridePendingTransition(0, 0)
    }

    fun successClick(v: View) {
        val intent = Intent()
        intent.putExtra("RESULT", "SUCCESS MESSAGE : Activity Two")
        setResult(RESULT_OK, intent)
        finish()
    }

    fun errorClick(v: View) {
        val intent = Intent()
        intent.putExtra("ERROR_CODE", "ERROR MESSAGE : Activity Two")
        setResult(RESULT_CANCELED, intent)
        finish()
    }
}