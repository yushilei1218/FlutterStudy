package com.yushilei.flutterstudy;

import android.net.Uri;
import android.os.Bundle;
import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private Uri mUri;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        mUri = getIntent().getData();
        if (mUri != null){

            Log.d("FlutterAAA", mUri.toString());
        }else {
            Log.d("FlutterAAA", "No uri");
        }
        new MethodChannel(getFlutterView(), "This_is_channel")
                .setMethodCallHandler(new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        if (methodCall.method.contentEquals("getUri")) {
                            result.success(mUri.toString());
                        }
                    }
                });
    }
}
