import 'package:dandy/Profile/Layaout/responsive_layout.dart';
import 'package:dandy/common/constants/components/logo.dart';
import 'package:dandy/common/constants/components/text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size;

    // set up the button
    Widget cancelButton = CupertinoDialogAction(
      child: TextInput(
        text: "Cerrar sesión",
        color: constantColors.greyText,
      ),
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, "/", ModalRoute.withName('/'));
      },
    );
    // set up the button
    Widget okButton = CupertinoDialogAction(
      child: TextInput(
        text: "Cancelar",
        color: constantColors.principal,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // set up the AlertDialog
    CupertinoAlertDialog alert = CupertinoAlertDialog(
      content: TextInput(
        text: "¿Estás seguro que quieres cerrar tu sesión?",
        color: Colors.black,
        fontSize: 12,
        weight: FontWeight.w600,
      ),
      actions: [
        cancelButton,
        okButton,
      ],
    );

    var iconLogOut = Container(
        // width: 100,
        //color: Colors.yellow,
        child: Row(
      children: [
        TextInput(
          text: "Log Out",
          color: Colors.white,
          weight: FontWeight.w700,
          fontSize: 14,
        ),
        Container(
          width: 40,
          padding: const EdgeInsets.all(8),
          child: IconButton(
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.login_outlined, color: Colors.white),
              onPressed: () {
                //print("object");
                // show the dialog
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return alert;
                  },
                );
              }

              /*() {
              Navigator.of(context).pushNamed(
                '/',
              );
              //print("object");
            },*/
              ),
        ),
      ],
    ));

    return AppBar(
      //leading: Text("Go back"),
      backgroundColor: constantColors.secondary,
      shadowColor: Colors.transparent,
      centerTitle: true,

      title: Container(
        // color: Colors.yellow,
        child: Logo(
          sizeLogo: 15.0,
          sizeTM: 15.0,
          color: constantColors.principal,
        ),
      ),
      actions: [iconLogOut],
    );
    /*Stack(children: <Widget>[
      Expanded(
          child: ResponsiveLayout(
        mobileBodyOne: AppBar(
          backgroundColor: const Color(0xFF18003A),
          title: Logo(
            color: Color.fromRGBO(236, 79, 12, 1),
            sizeLogo: 15.0,
            sizeTM: 15,
          ),
          //const Padding(padding: EdgeInsets.all(10)),
          //iconLogOut
        ),
        mobileBodyTwo: AppBar(
          backgroundColor: const Color(0xFF18003A),
          title: Logo(
            color: Color(0xFFec4f0c),
            sizeLogo: 15.0,
            sizeTM: 15.0,
          ),

          /*Column(children: <Widget>[
            Row(children: <Widget>[
              Logo(
                color: Color(0xFFec4f0c),
                sizeLogo: 15.0,
                sizeTM: 15.0,
              ),

              //Padding(padding: EdgeInsets.only(left: 10)),
              //iconLogOut
            ])
          ]),*/
        ),
        mobileBodyThree: AppBar(
          backgroundColor: const Color(0xFF18003A),
          title: Column(children: <Widget>[
            Row(children: <Widget>[
              Logo(
                color: Color(0xFFec4f0c),
                sizeLogo: 15.0,
                sizeTM: 15.0,
              ),

              //Padding(padding: EdgeInsets.only(left: 20)),
              // iconLogOut
            ])
          ]),
        ),
        mobileBodyFour: AppBar(
          backgroundColor: const Color(0xFF18003A),
          title: Column(children: <Widget>[
            Row(children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Logo(
                  color: Color(0xFFec4f0c),
                  sizeLogo: 15.0,
                  sizeTM: 15.0,
                ),
              ),
              // Padding(padding: EdgeInsets.only(left: 20)),
              // iconLogOut
            ])
          ]),
        ),
      ))
    ]);*/
  }
}
