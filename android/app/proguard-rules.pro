## Basic Flutter rules (essential for keeping the core engine functional)
#-keep class io.flutter.app.** { *; }
#-keep class io.flutter.plugins.** { *; }
#-keep class io.flutter.embedding.** { *; }
#
## START - Rules for Flutter Local Notifications (CRITICAL for your issue)
## Keep the native classes referenced in the AndroidManifest.xml
#-keep class com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver { *; }
#-keep class com.dexterous.flutterlocalnotifications.ScheduledNotificationReceiver { *; }
#-keep class com.dexterous.flutterlocalnotifications.** { *; }
## END - Rules for Flutter Local Notifications
#
## Aggressive Keep Rule for Google Play Core and all related dependencies
#-keep class com.google.android.play.core.** { *; }
#
## Also keep interfaces and members, often needed for asynchronous callbacks (Tasks)
#-keep interface com.google.android.play.core.** { *; }
#-keep class * implements com.google.android.play.core.tasks.OnSuccessListener { *; }
#-keep class * implements com.google.android.play.core.tasks.OnFailureListener { *; }
