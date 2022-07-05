import 'package:dandy/Authentication/services/authentication_services.dart';
import 'package:dandy/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

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

   return MultiProvider(
        providers: [
          Provider<AuthenticationServices>(
            create: (_) => AuthenticationServices(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: buildMaterialColor(constantColors.principal),
          ),
          initialRoute: '/home',
          onGenerateRoute: RouteGenerator.generateRoute,
        )
    );



  }
}
