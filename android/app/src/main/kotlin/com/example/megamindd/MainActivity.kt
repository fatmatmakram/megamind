package com.example.megamindd

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
}
//
//import android.os.Bundle
//import androidx.annotation.NonNull
//import io.flutter.embedding.android.FlutterActivity
//import io.flutter.embedding.engine.FlutterEngine
//import io.flutter.plugin.common.MethodChannel
//import kotlinx.coroutines.*
//import retrofit2.*
//import retrofit2.converter.gson.GsonConverterFactory
//
//class MainActivity : FlutterActivity() {
//    private val CHANNEL = "native_bridge"
//
//    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
//            if (call.method == "makeApiCall") {
//                makeApiCall(result)
//            } else {
//                result.notImplemented()
//            }
//        }
//    }
//
//    private fun makeApiCall(result: MethodChannel.Result) {
//        CoroutineScope(Dispatchers.IO).launch {
//            try {
//                val retrofit = Retrofit.Builder()
//                        .baseUrl("https://api.themoviedb.org/3/")
//                        .addConverterFactory(GsonConverterFactory.create())
//                        .build()
//
//                val service = retrofit.create(ApiService::class.java)
//                val response = service.getData().execute()
//
//                if (response.isSuccessful) {
//                    val responseBody = response.body()
//                    // Process the response as needed
//                    withContext(Dispatchers.Main) {
//                        result.success("API call successful")
//                    }
//                } else {
//                    withContext(Dispatchers.Main) {
//                        result.error("API call failed", "HTTP Error: ${response.code()}", null)
//                    }
//                }
//            } catch (e: Exception) {
//                withContext(Dispatchers.Main) {
//                    result.error("API call failed", e.message, null)
//                }
//            }
//        }
//    }
//}