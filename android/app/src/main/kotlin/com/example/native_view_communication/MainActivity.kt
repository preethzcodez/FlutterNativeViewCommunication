package com.example.native_view_communication

import android.app.Activity
import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    private val CHANNEL = "example.flutter.dev/nativeViewCommunication"
    var result: MethodChannel.Result? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getResult") {
                this.result = result
                showFirstActivity(call.argument("message"))
            } else {
                result.notImplemented()
            }
        }
    }

    private fun showFirstActivity(msg: String?) {
        val intent = Intent(this, ActivityOne::class.java)
        if (msg != null)
            intent.putExtra("msg", msg)
        startActivityForResult(intent, 100)
    }

    private fun showSecondActivity(msg: String?) {
        val intent = Intent(this, ActivityTwo::class.java)
        if (msg != null)
            intent.putExtra("msg", msg)
        startActivityForResult(intent, 100)
    }

    override fun onActivityResult(code: Int, resultCode: Int, data: Intent?) {
        if (code == 100) {
            if (resultCode == Activity.RESULT_OK) {
                val result = data?.getStringExtra("RESULT")
                if (result.equals("SWITCH_VIEW_FIRST")) {
                    showFirstActivity(data?.getStringExtra("msg"));
                } else if (result.equals("SWITCH_VIEW_SECOND")) {
                    showSecondActivity(data?.getStringExtra("msg"))
                } else {
                    result?.let { this.result?.success(result) }
                }
            } else {
                val errorCode = data?.getStringExtra("ERROR_CODE")
                this.result?.error(errorCode, null, null)
            }
        }
    }
}
