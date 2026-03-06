import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Submits feedback documents to a Firestore collection.
class SuggestionsRepository {
  final FirebaseFirestore _firestore;
  final String collectionPath;

  SuggestionsRepository({
    FirebaseFirestore? firestore,
    this.collectionPath = 'suggestions',
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  /// Adds a feedback document.
  ///
  /// Fields: `type`, `text`, `email`, `timestamp`, plus auto-detected
  /// app metadata: `appName`, `packageName`, `appVersion`, `buildNumber`,
  /// `platform`, `read`.
  Future<void> addSuggestion({
    required String type,
    required String text,
    String? email,
  }) async {
    String appName = '';
    String packageName = '';
    String version = '';
    String buildNumber = '';

    try {
      final info = await PackageInfo.fromPlatform();
      appName = info.appName;
      packageName = info.packageName;
      version = info.version;
      buildNumber = info.buildNumber;
    } catch (_) {}

    String platform = 'unknown';
    try {
      switch (defaultTargetPlatform) {
        case TargetPlatform.android:
          platform = 'android';
          break;
        case TargetPlatform.iOS:
          platform = 'ios';
          break;
        case TargetPlatform.fuchsia:
          platform = 'fuchsia';
          break;
        case TargetPlatform.linux:
          platform = 'linux';
          break;
        case TargetPlatform.macOS:
          platform = 'macos';
          break;
        case TargetPlatform.windows:
          platform = 'windows';
          break;
      }
    } catch (_) {}

    await _firestore.collection(collectionPath).add({
      'type': type,
      'text': text,
      'email': email ?? '',
      'timestamp': FieldValue.serverTimestamp(),
      'appName': appName,
      'packageName': packageName,
      'appVersion': version,
      'buildNumber': buildNumber,
      'platform': platform,
      'read': false,
    });
  }
}

