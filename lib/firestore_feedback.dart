/// Firestore Feedback SDK
///
/// A self-contained Flutter package that provides a ready-made feedback
/// screen backed by Cloud Firestore, with built-in translations for
/// de, en, es, fr, hi, it, ja, ko, pt, ru, uk.
///
/// Usage:
/// ```dart
/// import 'package:firestore_feedback/firestore_feedback.dart';
///
/// FeedbackSDK.show(context);
/// ```
library firestore_feedback;

export 'src/feedback_sdk.dart';
export 'src/l10n/generated/feedback_localizations.dart' show FeedbackLocalizations;
export 'src/presentation/feedback_page.dart' show FeedbackPage;

