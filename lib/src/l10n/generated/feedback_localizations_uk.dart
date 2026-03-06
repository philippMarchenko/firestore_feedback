// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class FeedbackLocalizationsUk extends FeedbackLocalizations {
  FeedbackLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get feedbackTitle => 'Зворотний зв\'язок';

  @override
  String get feedbackWelcome => 'Ми будемо раді почути вашу думку!';

  @override
  String get feedbackTypeSuggestion => 'Пропозиція';

  @override
  String get feedbackTypeBug => 'Повідомлення про помилку';

  @override
  String get feedbackTypeOther => 'Інше';

  @override
  String get feedbackEmailHint => 'Ел. пошта (необов\'язково)';

  @override
  String get feedbackDetailsLabel => 'Розкажіть детальніше';

  @override
  String get feedbackDetailsHint =>
      'Поділіться своїми думками, ідеями або повідомте про проблему...';

  @override
  String get feedbackSubmit => 'Надіслати відгук';

  @override
  String get feedbackSuccess => 'Дякуємо за ваш відгук!';

  @override
  String get feedbackError => 'Не вдалося надіслати відгук. Спробуйте ще раз.';
}
