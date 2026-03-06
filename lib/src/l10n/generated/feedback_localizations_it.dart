// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class FeedbackLocalizationsIt extends FeedbackLocalizations {
  FeedbackLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get feedbackTitle => 'Feedback';

  @override
  String get feedbackWelcome => 'Ci piacerebbe sentirti!';

  @override
  String get feedbackTypeSuggestion => 'Suggerimento';

  @override
  String get feedbackTypeBug => 'Segnalazione di bug';

  @override
  String get feedbackTypeOther => 'Altro';

  @override
  String get feedbackEmailHint => 'Email (opzionale)';

  @override
  String get feedbackDetailsLabel => 'Raccontaci di più';

  @override
  String get feedbackDetailsHint =>
      'Condividi i tuoi pensieri, idee o segnala un problema...';

  @override
  String get feedbackSubmit => 'Invia feedback';

  @override
  String get feedbackSuccess => 'Grazie per il tuo feedback!';

  @override
  String get feedbackError => 'Impossibile inviare il feedback. Riprova.';
}
