import 'package:flutter/material.dart';
import 'package:green_transport/app_routing/routing_constants.dart';
import 'package:green_transport/screens/bus_details.dart';
import 'package:green_transport/screens/home_screen.dart';
import 'package:green_transport/screens/select_language_screen.dart';
import 'package:green_transport/screens/splash_screen.dart';

class RouteGenerator {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Screens.SPLASH:
      return navigateToScreen(SplashScreen());
      case Screens.HOME:
        return navigateToScreen(HomeScreen());
      case Screens.DETAILS:
        return navigateToScreen(BusDetailsScreen());
      case Screens.SELECT_LANGUAGE:
        return navigateToScreen(SelectLanguageScreen());
      default:
        return null;
    }
  }

  static MaterialPageRoute navigateToScreen(Widget navigateTo) =>
      MaterialPageRoute<bool>(builder: (_) => navigateTo);
}
