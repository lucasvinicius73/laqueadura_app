# youtube_player_flutter - Preserve JavaScript interfaces for WebView
-keep class com.pierfrancescosoffritti.androidyoutubeplayer.** { *; }
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Flutter WebView
-keep class io.flutter.plugins.** { *; }
-keep class android.webkit.** { *; }
