// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'feedback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class FeedbackLocalizationsHi extends FeedbackLocalizations {
  FeedbackLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get feedbackTitle => 'फ़ीडबैक';

  @override
  String get feedbackWelcome => 'हम आपसे सुनना पसंद करेंगे!';

  @override
  String get feedbackTypeSuggestion => 'सुझाव';

  @override
  String get feedbackTypeBug => 'बग रिपोर्ट';

  @override
  String get feedbackTypeOther => 'अन्य';

  @override
  String get feedbackEmailHint => 'ईमेल (वैकल्पिक)';

  @override
  String get feedbackDetailsLabel => 'हमें और बताएं';

  @override
  String get feedbackDetailsHint =>
      'अपने विचार, विचार साझा करें या किसी समस्या की रिपोर्ट करें...';

  @override
  String get feedbackSubmit => 'फ़ीडबैक सबमिट करें';

  @override
  String get feedbackSuccess => 'आपके फ़ीडबैक के लिए धन्यवाद!';

  @override
  String get feedbackError => 'फ़ीडबैक भेजने में विफल। कृपया पुनः प्रयास करें।';
}
