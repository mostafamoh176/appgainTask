package com.example.appgain_task

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    private val channelName="Toasty_show";
    override fun configureFlutterEngine(flutterEngine: FlutterEngine){
        super.configureFlutterEngine(flutterEngine)
        var channel=MethodChannel(flutterEngine.dartExecutor.binaryMessenger,channelName);
        channel.setMethodCallHandler{
            call,result -> if(call.method=="showToast"){
                Toast.makeText(this,"fcddc",Toast.LENGTH_LONG).show();
            }
        }
    }
}
