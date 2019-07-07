import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:shared_preferences/shared_preferences.dart';

class AppTranslations {
  Locale locale;
  static Map<dynamic, dynamic> _localisedValues;

  AppTranslations(Locale locale) {
    this.locale = locale;
  }

  static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static Future<AppTranslations> load(Locale locale) async {
    AppTranslations appTranslations = AppTranslations(locale);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang_code = prefs.getString("lang_code") == null
        ? "en"
        : prefs.getString("lang_code");
    String jsonContent =
        //await rootBundle.loadString("assets/locale/localization_${locale.languageCode}.json");
        await rootBundle
            .loadString("locale/localization_${lang_code}.json");
    _localisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  get currentLanguage => locale.languageCode;

  String text(String key) {
    return _localisedValues[key] ?? "$key not found";
  }
}
