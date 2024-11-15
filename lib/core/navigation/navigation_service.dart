import 'package:flutter/material.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Navigate to a route by name
  void navigateTo(String routeName) {
    navigatorKey.currentState?.pushReplacementNamed(routeName);
  }

  // Go back to the previous route
  void goBack() {
    navigatorKey.currentState?.pop();
  }
}
