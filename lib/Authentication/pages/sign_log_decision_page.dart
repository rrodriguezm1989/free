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
                  Logo(36, 8),
                  Padding(
                    padding: EdgeInsets.only(top: 198, bottom: 250),
                    child: Text("Catchy is catchy?",
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
                    text: "Sign In",
                    onPress: () => {
                          Navigator.of(context).pushNamed(
                            '/signin/0',
                          )
                        },
                    width: 344.0,
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
        TextInput(text: "Don't have an account yet?"),
        TextButtonNoBorders(
          text: "Sign Up",
          onPress: () => {
            Navigator.of(context).pushNamed(
              '/login',
            )
          },
          color: Colors.white,
          underline: true,
        )
      ],
    );
  }
}
