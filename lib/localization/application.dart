import 'dart:ui';

class Application {
  static final Application _application = Application._internal();

  factory Application() {
    return _application;
  }

  Application._internal();

  static final Map<dynamic, dynamic> languagesMap = {
    supportedLanguages[0]: supportedLanguagesCodes[0],
    supportedLanguages[1]: supportedLanguagesCodes[1],
    supportedLanguages[2]: supportedLanguagesCodes[2],
  };

  static final List<String> supportedLanguages = ["English", "Hindi", "Gujarati"];

  static final List<String> supportedLanguagesCodes = ["en", "hi", "gu"];

  //returns the list of supported Locales
  Iterable<Locale> supportedLocales() =>
      supportedLanguagesCodes.map<Locale>((language) => Locale(language, ""));

  //function to be invoked when changing the language
  LocaleChangeCallback onLocaleChanged;
}

Application application = Application();

typedef void LocaleChangeCallback(Locale locale);
