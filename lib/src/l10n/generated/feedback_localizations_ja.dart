// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class FeedbackLocalizationsJa extends FeedbackLocalizations {
  FeedbackLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get feedbackTitle => 'フィードバック';

  @override
  String get feedbackWelcome => 'ご意見をお聞かせください！';

  @override
  String get feedbackTypeSuggestion => '提案';

  @override
  String get feedbackTypeBug => 'バグ報告';

  @override
  String get feedbackTypeOther => 'その他';

  @override
  String get feedbackEmailHint => 'メール（任意）';

  @override
  String get feedbackDetailsLabel => '詳しく教えてください';

  @override
  String get feedbackDetailsHint => 'ご意見、アイデア、または問題を報告してください...';

  @override
  String get feedbackSubmit => 'フィードバックを送信';

  @override
  String get feedbackSuccess => 'フィードバックありがとうございます！';

  @override
  String get feedbackError => 'フィードバックの送信に失敗しました。もう一度お試しください。';
}
