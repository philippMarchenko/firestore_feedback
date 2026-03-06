// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class FeedbackLocalizationsKo extends FeedbackLocalizations {
  FeedbackLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get feedbackTitle => '피드백';

  @override
  String get feedbackWelcome => '여러분의 의견을 듣고 싶습니다!';

  @override
  String get feedbackTypeSuggestion => '제안';

  @override
  String get feedbackTypeBug => '버그 신고';

  @override
  String get feedbackTypeOther => '기타';

  @override
  String get feedbackEmailHint => '이메일 (선택 사항)';

  @override
  String get feedbackDetailsLabel => '자세히 알려주세요';

  @override
  String get feedbackDetailsHint => '생각, 아이디어를 공유하거나 문제를 신고하세요...';

  @override
  String get feedbackSubmit => '피드백 보내기';

  @override
  String get feedbackSuccess => '피드백 감사합니다!';

  @override
  String get feedbackError => '피드백 전송에 실패했습니다. 다시 시도해주세요.';
}
