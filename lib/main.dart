import 'package:dandy/Authentication/services/authentication_services.dart';
import 'package:dandy/Profile/profile.dart';
import 'package:dandy/coupon/screens/screen_coupon_book.dart';
import 'package:dandy/coupon/screens/screen_coupon_congrats.dart';
import 'package:dandy/coupon/widgets/coupon_card.dart';
import 'package:dandy/route_generator.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:dandy/survey/screens/screen_face_question.dart';
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
    final entries = <int, String>{};
    entries[0] = 'Respuesta uno';
    entries[1] = 'Respuesta dos';
    entries[2] = 'Respuesta tres';

  /*  return MultiProvider(
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
        )
    );*/
 return const MaterialApp(
   home: Profile(),
 )

   ;
  }
}
