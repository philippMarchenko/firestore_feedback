// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class FeedbackLocalizationsDe extends FeedbackLocalizations {
  FeedbackLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get feedbackTitle => 'Feedback';

  @override
  String get feedbackWelcome => 'Wir würden uns freuen, von Ihnen zu hören!';

  @override
  String get feedbackTypeSuggestion => 'Vorschlag';

  @override
  String get feedbackTypeBug => 'Fehlerbericht';

  @override
  String get feedbackTypeOther => 'Sonstiges';

  @override
  String get feedbackEmailHint => 'E-Mail (optional)';

  @override
  String get feedbackDetailsLabel => 'Erzählen Sie uns mehr';

  @override
  String get feedbackDetailsHint =>
      'Teilen Sie Ihre Gedanken, Ideen oder melden Sie ein Problem...';

  @override
  String get feedbackSubmit => 'Feedback senden';

  @override
  String get feedbackSuccess => 'Vielen Dank für Ihr Feedback!';

  @override
  String get feedbackError =>
      'Feedback konnte nicht gesendet werden. Bitte versuchen Sie es erneut.';
}
