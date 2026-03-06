import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'data/suggestions_repository.dart';
import 'l10n/feedback_strings.dart';
import 'presentation/feedback_page.dart';

export 'l10n/feedback_strings.dart';
export 'presentation/feedback_page.dart' show FeedbackPage;

/// Entry point for the Firestore Feedback SDK.
///
/// ```dart
/// // Simplest usage
/// FeedbackSDK.show(context);
///
/// // Custom collection + strings
/// FeedbackSDK.show(
///   context,
///   collectionPath: 'app_feedback',
///   strings: FeedbackStrings(title: 'Help us improve'),
/// );
/// ```
class FeedbackSDK {
  FeedbackSDK._();

  /// Pushes [FeedbackPage] onto the navigator stack.
  ///
  /// [collectionPath] – Firestore collection to write documents to.
  ///   Defaults to `'suggestions'`.
  ///
  /// [firestore] – optional [FirebaseFirestore] instance (useful for
  ///   testing or when using a non-default Firebase app).
  ///
  /// [strings] – override any UI label; defaults to English copy.
  static Future<void> show(
    BuildContext context, {
    String collectionPath = 'suggestions',
    FirebaseFirestore? firestore,
    FeedbackStrings strings = const FeedbackStrings(),
  }) {
    final repository = SuggestionsRepository(
      firestore: firestore,
      collectionPath: collectionPath,
    );
    return Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => FeedbackPage(
          repository: repository,
          strings: strings,
        ),
      ),
    );
  }
}

