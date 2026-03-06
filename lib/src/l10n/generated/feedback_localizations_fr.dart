// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class FeedbackLocalizationsFr extends FeedbackLocalizations {
  FeedbackLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get feedbackTitle => 'Commentaires';

  @override
  String get feedbackWelcome => 'Nous aimerions avoir de vos nouvelles !';

  @override
  String get feedbackTypeSuggestion => 'Suggestion';

  @override
  String get feedbackTypeBug => 'Rapport de bug';

  @override
  String get feedbackTypeOther => 'Autre';

  @override
  String get feedbackEmailHint => 'E-mail (facultatif)';

  @override
  String get feedbackDetailsLabel => 'Dites-nous en plus';

  @override
  String get feedbackDetailsHint =>
      'Partagez vos pensées, idées ou signalez un problème...';

  @override
  String get feedbackSubmit => 'Envoyer les commentaires';

  @override
  String get feedbackSuccess => 'Merci pour vos commentaires !';

  @override
  String get feedbackError =>
      'Échec de l\'envoi des commentaires. Veuillez réessayer.';
}
