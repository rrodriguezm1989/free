import 'package:dandy/Authentication/services/authentication_services.dart';
import 'package:dandy/coupon/screens/screen_coupon_book.dart';
import 'package:dandy/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const CouponBook(points: 13482),
    // );
    return MultiProvider(
        providers: [
          Provider<AuthenticationServices>(
            create: (_) => AuthenticationServices(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
