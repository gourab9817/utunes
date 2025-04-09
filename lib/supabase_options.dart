// supabase_options.dart
// Configuration file for Supabase credentials

import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default Supabase configuration for your app.
///
/// Example:
/// ```
/// import 'supabase_options.dart';
/// // ...
/// await Supabase.initialize(
///   url: SupabaseOptions.supabaseUrl,
///   anonKey: SupabaseOptions.supabaseAnonKey,
/// );
/// ```
class SupabaseOptions {
  // Your Supabase project URL
  static const String supabaseUrl = 'https://gorqiqdimwzojxqxurzx.supabase.co';
  
  // Your Supabase anonymous key (public API key)
  static const String supabaseAnonKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdvcnFpcWRpbXd6b2p4cXh1cnp4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDQxNDE5OTEsImV4cCI6MjA1OTcxNzk5MX0.wOxpyQh3Phv4LuyKakyw3yIF-agioHiQTK8cmyZUFCQ';
  
  // Optional: Environment-specific configurations
  static String get currentEnvUrl {
    if (kIsWeb) {
      return supabaseUrl;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return supabaseUrl;
      default:
        return supabaseUrl;
    }
  }
  
  static String get currentEnvAnonKey {
    if (kIsWeb) {
      return supabaseAnonKey;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return supabaseAnonKey;
      default:
        return supabaseAnonKey;
    }
  }
}
