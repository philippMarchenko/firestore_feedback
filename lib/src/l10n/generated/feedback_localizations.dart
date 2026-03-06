import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'feedback_localizations_de.dart';
import 'feedback_localizations_en.dart';
import 'feedback_localizations_es.dart';
import 'feedback_localizations_fr.dart';
import 'feedback_localizations_hi.dart';
import 'feedback_localizations_it.dart';
import 'feedback_localizations_ja.dart';
import 'feedback_localizations_ko.dart';
import 'feedback_localizations_pt.dart';
import 'feedback_localizations_ru.dart';
import 'feedback_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of FeedbackLocalizations
/// returned by `FeedbackLocalizations.of(context)`.
///
/// Applications need to include `FeedbackLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/feedback_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: FeedbackLocalizations.localizationsDelegates,
///   supportedLocales: FeedbackLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the FeedbackLocalizations.supportedLocales
/// property.
abstract class FeedbackLocalizations {
  FeedbackLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static FeedbackLocalizations of(BuildContext context) {
    return Localizations.of<FeedbackLocalizations>(
      context,
      FeedbackLocalizations,
    )!;
  }

  static const LocalizationsDelegate<FeedbackLocalizations> delegate =
      _FeedbackLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('uk'),
  ];

  /// No description provided for @feedbackTitle.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get feedbackTitle;

  /// No description provided for @feedbackWelcome.
  ///
  /// In en, this message translates to:
  /// **'We\'d love to hear from you!'**
  String get feedbackWelcome;

  /// No description provided for @feedbackTypeSuggestion.
  ///
  /// In en, this message translates to:
  /// **'Suggestion'**
  String get feedbackTypeSuggestion;

  /// No description provided for @feedbackTypeBug.
  ///
  /// In en, this message translates to:
  /// **'Bug Report'**
  String get feedbackTypeBug;

  /// No description provided for @feedbackTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get feedbackTypeOther;

  /// No description provided for @feedbackEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Email (optional)'**
  String get feedbackEmailHint;

  /// No description provided for @feedbackDetailsLabel.
  ///
  /// In en, this message translates to:
  /// **'Tell us more'**
  String get feedbackDetailsLabel;

  /// No description provided for @feedbackDetailsHint.
  ///
  /// In en, this message translates to:
  /// **'Share your thoughts, ideas, or report an issue...'**
  String get feedbackDetailsHint;

  /// No description provided for @feedbackSubmit.
  ///
  /// In en, this message translates to:
  /// **'Submit Feedback'**
  String get feedbackSubmit;

  /// No description provided for @feedbackSuccess.
  ///
  /// In en, this message translates to:
  /// **'Thank you for your feedback!'**
  String get feedbackSuccess;

  /// No description provided for @feedbackError.
  ///
  /// In en, this message translates to:
  /// **'Failed to send feedback. Please try again.'**
  String get feedbackError;
}

class _FeedbackLocalizationsDelegate
    extends LocalizationsDelegate<FeedbackLocalizations> {
  const _FeedbackLocalizationsDelegate();

  @override
  Future<FeedbackLocalizations> load(Locale locale) {
    return SynchronousFuture<FeedbackLocalizations>(
      lookupFeedbackLocalizations(locale),
    );
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'it',
    'ja',
    'ko',
    'pt',
    'ru',
    'uk',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_FeedbackLocalizationsDelegate old) => false;
}

FeedbackLocalizations lookupFeedbackLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return FeedbackLocalizationsDe();
    case 'en':
      return FeedbackLocalizationsEn();
    case 'es':
      return FeedbackLocalizationsEs();
    case 'fr':
      return FeedbackLocalizationsFr();
    case 'hi':
      return FeedbackLocalizationsHi();
    case 'it':
      return FeedbackLocalizationsIt();
    case 'ja':
      return FeedbackLocalizationsJa();
    case 'ko':
      return FeedbackLocalizationsKo();
    case 'pt':
      return FeedbackLocalizationsPt();
    case 'ru':
      return FeedbackLocalizationsRu();
    case 'uk':
      return FeedbackLocalizationsUk();
  }

  throw FlutterError(
    'FeedbackLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
