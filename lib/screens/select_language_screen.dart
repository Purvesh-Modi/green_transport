import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:green_transport/localization/application.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_translations.dart';
import 'app_translations_delegate.dart';

class SelectLanguageScreen extends StatefulWidget {
  @override
  SelectLanguageScreenState createState() {
    return new SelectLanguageScreenState();
  }
}

class SelectLanguageScreenState extends State<SelectLanguageScreen> {
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: null);
    application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(AppTranslations.of(context).text("Select_Language"),),
          //title: Text(AppTranslations.of(context).text("title_select_language"),),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Text("English"),
                onPressed: () {
                  _buildLanguageItem("English");
                },
              ),
              RaisedButton(
                child: Text("Hindi"),
                onPressed: () {
                  _buildLanguageItem("Hindi");
                },
              ),
              RaisedButton(
                child: Text("Gujarati"),
                onPressed: () {
                  _buildLanguageItem("Gujarati");
                },
              ),
            ],
          ),
        ),
      ),
      localizationsDelegates: [
        _newLocaleDelegate,
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", ""),
        const Locale("hi", ""),
        const Locale("gu", ""),
      ],
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }

  _buildLanguageItem(String language) {
    print(language);
    storeInLocal(language);
  }

  Future storeInLocal(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', language);
    prefs.setString('lang_code', Application.languagesMap[language]);
    print(prefs.getString('lang_code'));
    application.onLocaleChanged(Locale(Application.languagesMap[language]));
  }
}
