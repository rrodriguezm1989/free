import 'dart:ui';

import 'package:dandy/Authentication/bloc/authentication_bloc.dart';
import 'package:dandy/Authentication/bloc/authentication_event.dart';
import 'package:dandy/Authentication/components/background.dart';
import 'package:dandy/Authentication/components/white_background.dart';
import 'package:dandy/Authentication/services/authentication_services.dart';
import 'package:dandy/Profile/Coupon_view.dart';
import 'package:dandy/common/constants/components/dropdown_input.dart';
import 'package:dandy/common/constants/components/listview_with_search.dart';
import 'package:dandy/common/constants/components/logo.dart';
import 'package:dandy/common/constants/components/text_button_no_borders.dart';
import 'package:dandy/common/constants/components/text_input.dart';
import 'package:dandy/common/constants/components/typical_input.dart';
import 'package:dandy/common/constants/components/large_button.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:dandy/survey/utils/mock_questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/Authentication/components/activity_indicator.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:dandy/common/constants/utils/constant_departamentos_guatemala.dart';
import 'dart:math' as math; // import this

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  late final AuthenticationServices _bloc;

  var birthDateController = TextEditingController();

  @override
  void didChangeDependencies() {
    // Get the bloc in the 1st page
    _bloc = Provider.of<AuthenticationServices>(context);
    //_bloc = Provider.of<AuthenticationServices>(context);
    super.didChangeDependencies();
  }

  @override
  dispose() {
    super.dispose();
  }

  Center Body(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Center(
        child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: constantColors.secondary,
        image: DecorationImage(
            image: AssetImage("assets/images/background_lines.png"),
            //fit: BoxFit.cover,
            scale: 0.5),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
          //color: Colors.yellow,
          width: width * 0.92,
          height: height,
          //alignment: Alignment.bottomCenter,
          //color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              extraPointsButton(width: width),
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: TextInput(
                        text: "Escanea tus productos",
                        weight: FontWeight.w600,
                        fontSize: width * 18 / 375,
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    bottom: 30.0 * height / 675, top: 30 * height / 675),
                child: openCamera(width: width),
              ),
              Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        '/coupon/0',
                      );
                    },
                    child: TextInput(
                      text: "Redime tus puntos",
                      weight: FontWeight.w600,
                      fontSize: width * 18 / 375,
                    ),
                  )),
              Container(
                height: height * .5,
                child: CouponView(),
                padding: EdgeInsets.only(top: height * 16 / 675),
              ),
            ],
          )),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // ignore: dead_code
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Body(context),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        foregroundColor: constantColors.principal,
        // surfaceTintColor: Colors.red,
        //primary: false,
        title:
            //color: Colors.white60,
            Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Logo(
              sizeLogo: 15.0,
              sizeTM: 15.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 135 / 374),
              child: userPoints(
                points: _bloc.points,
                name: _bloc.name,
                lastName: _bloc.lastName,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class openCamera extends StatelessWidget {
  const openCamera({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              constantColors.softPrincipal,
              constantColors.tropicalPrincipal
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.all(
            Radius.circular(width * 8 / 375),
          )),
      child: Container(
        //color: Colors.yellow,
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.of(context).pushNamed(
                '/scan/0',
              );
            },
            icon: Icon(
              Icons.crop_free,
              size: width * 24 / 375,
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
            ),
            label: Container(
              //color: Colors.transparent,
              width: width * 312 / 375,
              height: width * 52 / 375,
              //color: Colors.yellow,

              //padding: EdgeInsets.only(left: 0),
              alignment: Alignment.centerLeft,
              child: TextInput(
                text: "Abrir Cámara",
                weight: FontWeight.w700,
                fontSize: width * 18 / 375,
              ),
            )),
      ),
    );
  }
}

class extraPointsButton extends StatelessWidget {
  const extraPointsButton({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 56 / 375),
                    side: BorderSide(color: Colors.red)))),
        child: Container(
          //color: Colors.yellow,
          width: width * 312 / 375,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 20,
                height: height * 40 / 675,
                alignment: Alignment.center,
                //  color: Colors.black,
                padding: EdgeInsets.only(
                    right: width * 15 / 375, left: width * 12 / 375),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
                      ),
                    ),
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/survey/0',
                      arguments:
                          SurveyHolder(questions: questionsList, points: 20));
                },
                child: TextInput(
                  text: "Gana puntos extra entrando aquí",
                  weight: FontWeight.w700,
                  fontSize: width * 14 / 375,
                ),
              ),
              Container(
                width: 20,
                height: 30,
                //color: Colors.black,
                padding: EdgeInsets.only(
                    left: width * 15 / 375, right: width * 12 / 375),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios, color: Colors.white),
                    const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.arrow_back_ios, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class userPoints extends StatelessWidget {
  final int points;
  final String name;
  final String lastName;
  const userPoints({
    required this.points,
    required this.name,
    required this.lastName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    String capitalLetters = (name[0] + lastName[0]).toUpperCase();

    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            '/profile',
          );
        },
        child: Container(
          //color: Colors.yellow,
          width: width * 115 / 374,
          height: 50,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: width * 80 / 374,
                    height: height * 23 / 667,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: constantColors.principal,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width * 16 / 374),
                          bottomLeft: Radius.circular(width * 16 / 374),
                        )),
                    child: TextInput(
                      text: "$points pts",
                      fontSize: width * 12 / 374,
                      weight: FontWeight.w600,
                      color: constantColors.secondary,
                    )),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: constantColors.principal.withOpacity(1)),
                  child: TextInput(
                    text: "$capitalLetters",
                    color: constantColors.secondary,
                    fontSize: width * 19 / 374,
                    weight: FontWeight.w700,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
