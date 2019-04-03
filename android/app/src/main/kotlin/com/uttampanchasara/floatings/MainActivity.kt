package com.uttampanchasara.floatings

import android.os.Bundle
import android.widget.Toast

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {

  companion object {
    const val CHANNEL = "flutter.toast.message.channel"
    const val METHOD_TOAST = "toast"
    const val KEY_MESSAGE = "message"
  }

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    // handle method invocation from flutter, and perform action
    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      if (call.method == METHOD_TOAST) {
        val message = call.argument<String>(KEY_MESSAGE)
        Toast.makeText(this@MainActivity, message, Toast.LENGTH_SHORT).show()
      }
    }
  }
}
