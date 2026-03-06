// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class FeedbackLocalizationsRu extends FeedbackLocalizations {
  FeedbackLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get feedbackTitle => 'Обратная связь';

  @override
  String get feedbackWelcome => 'Мы будем рады услышать ваше мнение!';

  @override
  String get feedbackTypeSuggestion => 'Предложение';

  @override
  String get feedbackTypeBug => 'Сообщение об ошибке';

  @override
  String get feedbackTypeOther => 'Другое';

  @override
  String get feedbackEmailHint => 'Эл. почта (необязательно)';

  @override
  String get feedbackDetailsLabel => 'Расскажите подробнее';

  @override
  String get feedbackDetailsHint =>
      'Поделитесь своими мыслями, идеями или сообщите о проблеме...';

  @override
  String get feedbackSubmit => 'Отправить отзыв';

  @override
  String get feedbackSuccess => 'Спасибо за ваш отзыв!';

  @override
  String get feedbackError => 'Не удалось отправить отзыв. Попробуйте ещё раз.';
}
