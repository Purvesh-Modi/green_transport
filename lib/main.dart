import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:green_transport/screens/app_translations_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_routing/route_generator.dart';
import 'app_routing/routing_constants.dart';
import 'localization/application.dart';

void main() => runApp(GreenTransport());

class GreenTransport extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _GreenTransportState createState() => _GreenTransportState();
}

class _GreenTransportState extends State<GreenTransport> {
  AppTranslationsDelegate _newLocaleDelegate = AppTranslationsDelegate(newLocale: Locale('gu'));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Green Transport',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: Screens.SPLASH,
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

  Future storeInLocal(String language) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('lang', language);
    prefs.setString('lang_code', Application.languagesMap[language]);
    print(prefs.getString('lang_code'));
    application.onLocaleChanged(Locale(Application.languagesMap[language]));
  }
}
