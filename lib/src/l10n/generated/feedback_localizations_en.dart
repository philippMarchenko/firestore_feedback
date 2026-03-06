// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class FeedbackLocalizationsEn extends FeedbackLocalizations {
  FeedbackLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get feedbackTitle => 'Feedback';

  @override
  String get feedbackWelcome => 'We\'d love to hear from you!';

  @override
  String get feedbackTypeSuggestion => 'Suggestion';

  @override
  String get feedbackTypeBug => 'Bug Report';

  @override
  String get feedbackTypeOther => 'Other';

  @override
  String get feedbackEmailHint => 'Email (optional)';

  @override
  String get feedbackDetailsLabel => 'Tell us more';

  @override
  String get feedbackDetailsHint =>
      'Share your thoughts, ideas, or report an issue...';

  @override
  String get feedbackSubmit => 'Submit Feedback';

  @override
  String get feedbackSuccess => 'Thank you for your feedback!';

  @override
  String get feedbackError => 'Failed to send feedback. Please try again.';
}
