// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class FeedbackLocalizationsEs extends FeedbackLocalizations {
  FeedbackLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get feedbackTitle => 'Comentarios';

  @override
  String get feedbackWelcome => '¡Nos encantaría saber de ti!';

  @override
  String get feedbackTypeSuggestion => 'Sugerencia';

  @override
  String get feedbackTypeBug => 'Reporte de error';

  @override
  String get feedbackTypeOther => 'Otro';

  @override
  String get feedbackEmailHint => 'Correo electrónico (opcional)';

  @override
  String get feedbackDetailsLabel => 'Cuéntanos más';

  @override
  String get feedbackDetailsHint =>
      'Comparte tus ideas, pensamientos o reporta un problema...';

  @override
  String get feedbackSubmit => 'Enviar comentarios';

  @override
  String get feedbackSuccess => '¡Gracias por tus comentarios!';

  @override
  String get feedbackError =>
      'Error al enviar comentarios. Por favor, inténtalo de nuevo.';
}
