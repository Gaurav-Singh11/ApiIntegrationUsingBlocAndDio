import 'package:netcarrots_task/src/business_layer/localization/english_text.dart';
import 'package:flutter/widgets.dart';

class AppLocalizations {
  static late AppLocalizations current;
  static late Locale locale;

  /// Private constructor to initialize the localization with a given locale.
  AppLocalizations._(Locale appLocale) {
    current = this;
  }

  /// Load the localization with a specified [appLocale].
  /// Returns a [Future] of [AppLocalizations] with the specified locale.
  static Future<AppLocalizations> load(Locale appLocale) {
    locale = appLocale;
    return Future.value(AppLocalizations._(appLocale));
  }

  /// Localizations are usually accessed using the [InheritedWidget] "of" syntax.
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// Map of values for supported languages.
  static final Map<String, Map<String, String>> _localizedValues = {
    /// English text
    "en": EnglishText.text,
  };

  ///Getters of all keys of supported language map
  String get title => _localizedValues[locale.languageCode]?['title'] ?? "";

  String get apiExceptionMessage => _localizedValues[locale.languageCode]?['api_exception'] ?? "";

  String get timeoutExceptionMessage => _localizedValues[locale.languageCode]?['timeout_exception'] ?? "";

  String get socketExceptionMessage => _localizedValues[locale.languageCode]?['socket_exception'] ?? "";

  String get parseExceptionMessage => _localizedValues[locale.languageCode]?['parse_exception'] ?? "";

  String get login => _localizedValues[locale.languageCode]?['login'] ?? "";

  String get mobileNumberRequired => _localizedValues[locale.languageCode]?['mobile_number_required'] ?? "";

  String get allFieldsAreMandatory => _localizedValues[locale.languageCode]?['all_fields_are_mandatory'] ?? "";

  String get mobileNo => _localizedValues[locale.languageCode]?['mobile_number'] ?? "";

  String get otp => _localizedValues[locale.languageCode]?['otp'] ?? "";

  String get captchaCode => _localizedValues[locale.languageCode]?['captcha_code'] ?? "";

  String get otpScreen => _localizedValues[locale.languageCode]?['otp_screen'] ?? "";

  String get userDetailScreen => _localizedValues[locale.languageCode]?['user_detail_screen'] ?? "";

  String get name => _localizedValues[locale.languageCode]?['name'] ?? "";

  String get mobileNumber => _localizedValues[locale.languageCode]?['mobile_no'] ?? "";

  String get dateOfBirth => _localizedValues[locale.languageCode]?['date_of_birth'] ?? "";

  String get designation => _localizedValues[locale.languageCode]?['designation'] ?? "";

  String get memberType => _localizedValues[locale.languageCode]?['member_type'] ?? "";

  String get firmName => _localizedValues[locale.languageCode]?['firm_name'] ?? "";

  String get verify => _localizedValues[locale.languageCode]?['verify'] ?? "";

  String get captchaCopied => _localizedValues[locale.languageCode]?['captcha_copied'] ?? "";

}