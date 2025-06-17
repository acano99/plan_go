package com.example.plan_go

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.os.Handler
import android.os.Looper
import android.telephony.TelephonyManager
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.example/plan_go/ussd"
    private val PERMISSION_REQUEST_CODE = 1

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "requestCallPermission" -> {
                    handleCallPermission(result)
                }
                "sendUssd" -> {
                    val ussdCode = call.argument<String>("code")
                    if (!ussdCode.isNullOrEmpty()) {
                        sendUssd(ussdCode, result)
                    } else {
                        result.error("INVALID_ARGUMENT", "USSD code is null or empty", null)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun handleCallPermission(result: MethodChannel.Result) {
        val permission = Manifest.permission.CALL_PHONE
        if (ContextCompat.checkSelfPermission(this, permission) == PackageManager.PERMISSION_GRANTED) {
            result.success(true)
        } else {
            ActivityCompat.requestPermissions(this, arrayOf(permission), PERMISSION_REQUEST_CODE)
            result.success(false)
        }
    }

    private fun sendUssd(ussdCode: String, result: MethodChannel.Result) {
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.CALL_PHONE) != PackageManager.PERMISSION_GRANTED) {
            result.error("PERMISSION_DENIED", "CALL_PHONE permission not granted", null)
            return
        }

        val telephonyManager = getSystemService(Context.TELEPHONY_SERVICE) as TelephonyManager
        val handler = Handler(Looper.getMainLooper())

        telephonyManager.sendUssdRequest(
            ussdCode,
            object : TelephonyManager.UssdResponseCallback() {
                override fun onReceiveUssdResponse(
                    telephonyManager: TelephonyManager?,
                    request: String?,
                    response: CharSequence?
                ) {
                    super.onReceiveUssdResponse(telephonyManager, request, response)
                    result.success(response?.toString() ?: "Respuesta vacía")
                }

                override fun onReceiveUssdResponseFailed(
                    telephonyManager: TelephonyManager?,
                    request: String?,
                    failureCode: Int
                ) {
                    super.onReceiveUssdResponseFailed(telephonyManager, request, failureCode)
                    val errorMessage = "USSD request failed with code: $failureCode"
                    result.error("USSD_ERROR", errorMessage, null)
                }
            },
            handler
        )
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        if (requestCode == PERMISSION_REQUEST_CODE) {
            val granted = grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED
            if (granted) {
                // Aquí podrías notificar al Flutter que el permiso fue concedido
            }
        }
    }
}