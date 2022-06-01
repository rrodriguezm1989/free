import 'package:dandy/common/constants/components/large_button.dart';
import 'package:dandy/common/constants/components/logo.dart';
import 'package:dandy/common/constants/components/text_button_no_borders.dart';
import 'package:dandy/common/constants/components/text_input.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;

class SignLogDecisionPage extends StatelessWidget {
  const SignLogDecisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(color: constantColors.principal),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 48, top: 90),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                        width: 200,
                        child: Logo(
                          sizeLogo: 36.0,
                          sizeTM: 8.0,
                          color: constantColors.secondary,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 198, bottom: 250),
                    child: Text("Catchy es catchy?",
                        style: GoogleFonts.montserratAlternates(
                            color: constantColors.secondary,
                            fontWeight: FontWeight.w400,
                            fontSize: 48)),
                  )
                ],
              ),
            ),
            Column(
              children: [
                LargeButton(
                    text: "Iniciar sesión",
                    onPress: () => {
                          Navigator.of(context).pushNamed(
                            '/login/0',
                          )
                        },
                    width: 344.0,
                    height: 52.0,
                    borders: false,
                    color: constantColors.secondary),
                alreadyHaveAnAccount(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row alreadyHaveAnAccount(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextInput(text: "No tienes cuenta?"),
        TextButtonNoBorders(
          text: "Crear cuenta nueva",
          onPress: () => {
            Navigator.of(context).pushNamed(
              '/sign_up/0',
            )
          },
          color: Colors.white,
          underline: true,
        )
      ],
    );
  }
}
