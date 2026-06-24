@file:Suppress("UnresolvedReference")
package com.trioverse.uniceps

import android.content.Intent
import android.net.Uri
import android.provider.OpenableColumns
import androidx.core.content.FileProvider
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.io.File

/**
 * MainActivity handles the native side of the Content Resolver and File Sharing.
 */
class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.trioverse.uniceps/content_resolver"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                /**
                 * Shares a file from the app's local storage to other applications.
                 * 
                 * Arguments:
                 * - 'path': Absolute path to the local file.
                 * - 'title': The title shown in the Android Share Sheet.
                 */
                "shareFile" -> {
                    val filePath = call.argument<String>("path")
                    val title = call.argument<String>("title") ?: "Share File"
                    
                    if (filePath == null) {
                        result.error("INVALID_ARGUMENT", "File path is null", null)
                        return@setMethodCallHandler
                    }

                    try {
                        val file = File(filePath)
                        if (!file.exists()) {
                            result.error("FILE_NOT_FOUND", "File does not exist at path: $filePath", null)
                            return@setMethodCallHandler
                        }

                        // Get a shareable URI using the FileProvider defined in AndroidManifest.xml
                        val contentUri: Uri = FileProvider.getUriForFile(
                            this,
                            "${packageName}.fileprovider",
                            file
                        )

                        val shareIntent = Intent().apply {
                            action = Intent.ACTION_SEND
                            putExtra(Intent.EXTRA_STREAM, contentUri)
                            type = "application/octet-stream" 
                            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
                        }

                        // Show the Android Share Sheet
                        startActivity(Intent.createChooser(shareIntent, title))
                        result.success(null)
                    } catch (e: Exception) {
                        result.error("SHARE_ERROR", e.message, null)
                    }
                }

                "readContentUri" -> {
                    val uriString = call.argument<String>("uri") ?: return@setMethodCallHandler result.error("INVALID_ARGUMENT", "URI null", null)
                    try {
                        val contentUri = Uri.parse(uriString)
                        val bytes = contentResolver.openInputStream(contentUri)?.use { it.readBytes() }
                        if (bytes != null) {
                            result.success(bytes)
                        } else {
                            result.error("READ_ERROR", "Could not read bytes", null)
                        }
                    } catch (e: Exception) {
                        result.error("EXCEPTION", e.message, null)
                    }
                }

                "getFileName" -> {
                    val uriString = call.argument<String>("uri") ?: return@setMethodCallHandler result.error("INVALID_ARGUMENT", "URI null", null)
                    try {
                        val contentUri = Uri.parse(uriString)
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
