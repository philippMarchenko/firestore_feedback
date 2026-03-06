import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'data/suggestions_repository.dart';
import 'l10n/generated/feedback_localizations.dart';
import 'presentation/feedback_page.dart';

export 'l10n/generated/feedback_localizations.dart' show FeedbackLocalizations;
export 'presentation/feedback_page.dart' show FeedbackPage;

/// Entry point for the Firestore Feedback SDK.
///
/// ```dart
/// // Simplest usage – strings auto-translated to the device locale
/// FeedbackSDK.show(context);
///
/// // Custom Firestore collection
/// FeedbackSDK.show(context, collectionPath: 'app_feedback');
/// ```
class FeedbackSDK {
  FeedbackSDK._();

  /// Pushes the feedback screen onto the navigator stack.
  ///
  /// Strings are resolved automatically from the device locale.
  /// Supported locales: de, en, es, fr, hi, it, ja, ko, pt, ru, uk.
  /// Falls back to English for any unsupported locale.
  ///
  /// [collectionPath] – Firestore collection to write to. Defaults to `'suggestions'`.
  /// [firestore] – optional [FirebaseFirestore] instance for non-default Firebase apps.
  static Future<void> show(
    BuildContext context, {
    String collectionPath = 'suggestions',
    FirebaseFirestore? firestore,
  }) {
    final repository = SuggestionsRepository(
      firestore: firestore,
      collectionPath: collectionPath,
    );

    return Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => Localizations.override(
          context: context,
          delegates: FeedbackLocalizations.localizationsDelegates,
          child: FeedbackPage(repository: repository),
        ),
      ),
    );
  }
}
