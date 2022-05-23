import 'package:dandy/Authentication/pages/sign_log_decision_page.dart';
import 'package:dandy/Authentication/pages/sign_up.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SignLogDecisionPage());
      case '/signup/0':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(builder: (_) => const SignUp());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('ERROR'),
        ),
        body: const Center(child: Text('ERROR')),
      );
    });
  }
}
