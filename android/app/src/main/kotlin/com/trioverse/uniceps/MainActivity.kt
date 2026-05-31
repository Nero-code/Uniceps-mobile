package com.trioverse.uniceps

import android.net.Uri
import android.provider.OpenableColumns
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.trioverse.uniceps/content_resolver"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            val uriString = call.argument<String>("uri")
            if (uriString == null) {
                result.error("INVALID_ARGUMENT", "URI string is null", null)
                return@setMethodCallHandler
            }
            val contentUri = Uri.parse(uriString)

            when (call.method) {
                "readContentUri" -> {
                    try {
                        val bytes = contentResolver.openInputStream(contentUri)?.use { it.readBytes() }
                        if (bytes != null) {
                            result.success(bytes)
                        } else {
                            result.error("READ_ERROR", "Could not read bytes from URI", null)
                        }
                    } catch (e: Exception) {
                        result.error("EXCEPTION", e.message, null)
                    }
                }
                "getFileName" -> {
                    try {
                        var fileName: String? = null
                        if (contentUri.scheme == "content") {
                            val cursor = contentResolver.query(contentUri, null, null, null, null)
                            cursor?.use {
                                if (it.moveToFirst()) {
                                    val nameIndex = it.getColumnIndex(OpenableColumns.DISPLAY_NAME)
                                    if (nameIndex != -1) {
                                        fileName = it.getString(nameIndex)
                                    }
                                }
                            }
                        }
                        if (fileName == null) {
                            fileName = contentUri.path?.let { path ->
                                val lastSlash = path.lastIndexOf('/')
                                if (lastSlash != -1) path.substring(lastSlash + 1) else path
                            }
                        }
                        result.success(fileName)
                    } catch (e: Exception) {
                        result.error("EXCEPTION", e.message, null)
                    }
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}
