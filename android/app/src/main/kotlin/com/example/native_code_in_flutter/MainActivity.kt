package com.example.native_code_in_flutter

import io.flutter.embedding.android.FlutterActivity

// new import for connect to android native.
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

// ========== Code to implement ==========
private val CHANNEL = "samples.grassrootengineer.com"

override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
        call, result ->
        if (call.method == "getVersion") {
        result.success("Android: "+ Build.VERSION.RELEASE)
        // Build.VERSION.RELEASE เป็น function ของ Android นะ
        // https://developer.android.com/reference/android/os/Build.VERSION

        } else {
        result.notImplemented()
        }
    }
}
// ========== End code ==========

}
