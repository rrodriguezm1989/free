import 'package:dandy/Profile/Layaout/responsive_layout.dart';
import 'package:dandy/common/constants/components/logo.dart';
import 'package:dandy/common/constants/components/text_input.dart';
import 'package:flutter/material.dart';

class ProfileAppbar extends StatelessWidget {
  const ProfileAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size;


    final iconLogOut = Stack(
      children: [
        Row(
          children: [
            TextInput(
              text: "log Out",
              color: Colors.white,
            ),
            Row(children: const [
              IconButton(
                icon: Icon(Icons.login_outlined, color: Colors.white),
                onPressed: null,
              ),
            ]),
          ],
        )
      ],
    );

    return Stack(children: <Widget>[
      Expanded(
          child: ResponsiveLayout(
            mobileBodyOne: AppBar(
              backgroundColor: const Color(0xFF18003A),
              title: Column(children: <Widget>[
                Row(children: <Widget>[

                  Logo(
                    color: const Color(0xFFec4f0c),
                    sizeLogo: 20.0,
                    sizeTM: 10,
                    ),
                  const Padding(padding: EdgeInsets.all(10)),
                   iconLogOut
                ])
            ]),
          ),
            mobileBodyTwo: AppBar(
              backgroundColor: const Color(0xFF18003A),
              title: Column(children: <Widget>[
               Row(children: <Widget>[
                Expanded(child:
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 40),
                  child: Logo(
                    color: Color(0xFFec4f0c),
                    sizeLogo: 25.0,
                    sizeTM: 10,
                  ),
                )),
                Padding(padding: EdgeInsets.only(left: 10)),
                iconLogOut
              ])
            ]),
            ),
            mobileBodyThree: AppBar(
              backgroundColor: const Color(0xFF18003A),
              title: Column(children: <Widget>[
                Row(children: <Widget>[

                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Logo(
                    color: Color(0xFFec4f0c),
                    sizeLogo: 30.0,
                    sizeTM: 10,
                  ),
                ),
                  Padding(padding: EdgeInsets.only(left: 20)),
                 iconLogOut
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
                    ),
                  ),
                 Padding(padding: EdgeInsets.only(left: 20)),
                   iconLogOut
                ])
             ]),
           ),
          ))
    ]);
  }
}
