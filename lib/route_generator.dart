import 'package:dandy/Authentication/pages/log_in_with_options.dart';
import 'package:dandy/Authentication/pages/sign_log_decision_page.dart';
import 'package:dandy/Authentication/pages/sign_up.dart';
import 'package:dandy/Authentication/pages/sign_up_1.dart';
import 'package:dandy/common/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:dandy/Authentication/pages/log_in.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SignLogDecisionPage());
      case '/sign_up/0':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(builder: (_) => SignUp());
      case '/sign_up/1':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(builder: (_) => SignUp1());
      case '/login/0':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(builder: (_) => LogInWithOptions());
      case '/login/1':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(builder: (_) => LogIn());

      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
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
