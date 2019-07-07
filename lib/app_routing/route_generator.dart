import 'package:flutter/material.dart';
import 'package:green_transport/app_routing/routing_constants.dart';
import 'package:green_transport/screens/home_screen.dart';

class RouteGenerator {
  static MaterialPageRoute<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Screens.SPLASH:
      //Todo: return splash screen
      case Screens.HOME:
        return navigateToScreen(HomeScreen());
      default:
        return null;
    }
  }

  static MaterialPageRoute navigateToScreen(Widget navigateTo) =>
      MaterialPageRoute<bool>(builder: (_) => navigateTo);
}
