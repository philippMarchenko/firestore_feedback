/// Firestore Feedback SDK
///
/// A self-contained Flutter package that provides a ready-made feedback
/// screen backed by Cloud Firestore.
///
/// Usage:
/// ```dart
/// import 'package:firestore_feedback/firestore_feedback.dart';
///
/// // From any widget:
/// FeedbackSDK.show(context);
/// ```
library firestore_feedback;

export 'src/feedback_sdk.dart';
export 'src/l10n/feedback_strings.dart';
export 'src/presentation/feedback_page.dart' show FeedbackPage;

