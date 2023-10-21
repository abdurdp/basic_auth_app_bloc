// localization.dart
import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);
  String get name {
    return _localizedStrings['name']!;
  }

  String get email {
    return _localizedStrings['email']!;
  }

  String get password {
    return _localizedStrings['password']!;
  }
  String get phone {
    return _localizedStrings['phone']!;
  }

  String get languageArabic {
    return _localizedStrings['languageArabic']!;
  }

  String get languageEnglish {
    return _localizedStrings['languageEnglish']!;
  }

  String get languageBangla {
    return _localizedStrings['languageBangla']!;
  }

  String get appTitle {
    return _localizedStrings['appTitle']!;
  }

  String get login {
    return _localizedStrings['login']!;
  }

  String get signup {
    return _localizedStrings['signup']!;
  }
  String get themeDark {
    return _localizedStrings['themeDark']!;
  }
  String get themeLight {
    return _localizedStrings['themeLight']!;
  }

  // Add the new strings here
  String get gender {
    return _localizedStrings['gender']!;
  }

  String get dob {
    return _localizedStrings['dob']!;
  }

  String get divisionId {
    return _localizedStrings['divisionId']!;
  }

  String get districtId {
    return _localizedStrings['districtId']!;
  }

  String get address {
    return _localizedStrings['address']!;
  }

  String get macAddress {
    return _localizedStrings['macAddress']!;
  }

  String get profilePhoto {
    return _localizedStrings['profilePhoto']!;
  }
  String get countryCode {
    return _localizedStrings['countryCode']!;
  }
  String get submit {
    return _localizedStrings['submit']!;
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
  _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings = {};

  Future<bool> load() async {
    // Load the appropriate language strings based on the locale
    final String localeName = Intl.canonicalizedLocale(locale.toString());
    final String jsonContent = await rootBundle
        .loadString('assets/translations/app_$localeName.json');
        // .then((value) => String.fromCharCodes(value.buffer.asUint64List()));

    final Map<String, dynamic> jsonMap = json.decode(jsonContent);
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));

    return true;
  }

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }

  static const List<Locale> supportedLocales = [
    Locale('en', 'US'),
    Locale('bn', 'BD'),
    Locale('ar', 'SA'),
  ];
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales
        .any((supportedLocale) => supportedLocale.languageCode == locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
