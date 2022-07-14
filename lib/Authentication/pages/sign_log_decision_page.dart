import 'package:dandy/common/constants/components/large_button.dart';
import 'package:dandy/common/constants/components/logo.dart';
import 'package:dandy/common/constants/components/text_button_no_borders.dart';
import 'package:dandy/common/constants/components/text_input.dart';
import 'package:dandy/coupon/utils/mock_coupon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;

class SignLogDecisionPage extends StatelessWidget {
  const SignLogDecisionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        //alignment: Alignment.bottomCenter,
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFFB814D), Color(0xFFFB285C)])),
        child: Container(
            decoration: const BoxDecoration(
              //color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/background_lines.png"),
                  //fit: BoxFit.cover,
                  scale: 0.5),
            ),
            //alignment: Alignment.bottomCenter,
            child: Container(
              //height: 20,
              //alignment: Alignment.bottomCenter,
              //color: Colors.white,
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  SizedBox(
                      width: width,
                      child: Logo(
                        sizeLogo: width * 48 / 375,
                        sizeTM: width * 12 / 375,
                        color: constantColors.secondary,
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: height * 92 / 675,
                        bottom: height * 112 / 675,
                        left: width * 20 / 375),
                    child: Text("Aqui va una frase catchy",
                        style: GoogleFonts.montserratAlternates(
                            color: constantColors.secondary,
                            fontWeight: FontWeight.w400,
                            fontSize: 48)),
                  ),
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
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 30 / 675),
                    child: alreadyHaveAnAccount(context),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Row alreadyHaveAnAccount(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextInput(text: "No tienes cuenta? "),
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
