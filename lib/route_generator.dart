import 'package:dandy/Authentication/pages/forget_password.dart';
import 'package:dandy/Authentication/pages/forget_password_reset.dart';
import 'package:dandy/Authentication/pages/log_in_with_options.dart';
import 'package:dandy/Authentication/pages/sign_log_decision_page.dart';
import 'package:dandy/Authentication/pages/sign_up.dart';
import 'package:dandy/Authentication/pages/sign_up_1.dart';
import 'package:dandy/Profile/profile.dart';
import 'package:dandy/common/pages/home.dart';
import 'package:dandy/coupon/screens/screen_coupon_book.dart';
import 'package:dandy/coupon/screens/screen_coupon_congrats.dart';
import 'package:dandy/coupon/screens/screen_coupon_description.dart';
import 'package:dandy/product_scan/screens/scan_product.dart';
import 'package:dandy/product_scan/screens/screen_scan_product_detail.dart';
import 'package:dandy/survey/screens/screen_survey.dart';
import 'package:dandy/survey/screens/screen_survey_congrats.dart';
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
      case '/forget_password/0':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case '/forget_password/1':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(builder: (_) => ForgetPasswordReset());
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
      case '/coupon/0':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(
            builder: (_) => const CouponBook(), settings: settings);
      case '/coupon/1':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(
            builder: (_) => CouponDescription(), settings: settings);
      case '/coupon/2':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(
            builder: (_) => CouponRedeemed(), settings: settings);
      case '/survey/0':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(
            builder: (_) => const ScreenQuestion(), settings: settings);
      case '/survey/1':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(
            builder: (_) => const SurveyCongrats(), settings: settings);
      case '/scan/0':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(
            builder: (_) => const ScanProductScreen(), settings: settings);
      case '/scan/1':
        // in case you wanna sent data?
        /*if (args is String) {
          return MaterialPageRoute(builder: (_) => const SignUp());
        } else {
          return _errorRoute();
        }*/
        return MaterialPageRoute(
            builder: (_) => ScreenScanProductDetail(), settings: settings);
      case '/profile':
        return MaterialPageRoute(builder: (_) => Profile());
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
