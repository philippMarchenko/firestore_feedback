// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class FeedbackLocalizationsPt extends FeedbackLocalizations {
  FeedbackLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get feedbackTitle => 'Feedback';

  @override
  String get feedbackWelcome => 'Adoraríamos ouvir você!';

  @override
  String get feedbackTypeSuggestion => 'Sugestão';

  @override
  String get feedbackTypeBug => 'Relatório de bug';

  @override
  String get feedbackTypeOther => 'Outro';

  @override
  String get feedbackEmailHint => 'E-mail (opcional)';

  @override
  String get feedbackDetailsLabel => 'Conte-nos mais';

  @override
  String get feedbackDetailsHint =>
      'Compartilhe seus pensamentos, ideias ou relate um problema...';

  @override
  String get feedbackSubmit => 'Enviar feedback';

  @override
  String get feedbackSuccess => 'Obrigado pelo seu feedback!';

  @override
  String get feedbackError =>
      'Falha ao enviar feedback. Por favor, tente novamente.';
}
