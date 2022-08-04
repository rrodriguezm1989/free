import 'package:dandy/Authentication/services/authentication_services.dart';
import 'package:dandy/Profile/Coupon_view.dart';
import 'package:dandy/Profile/points_description.dart';
import 'package:dandy/Profile/see_more.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late final AuthenticationServices _bloc;

  String name = "Name";

  String lastName = "last";

  double pointUser = 13.482;

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

  @override
  Widget build(BuildContext context) {
    Center;
    {
      return Stack(children: <Widget>[
        Container(
          color: secondary,
          child: ListView(children: <Widget>[
            PointsDescription(
                lastName: _bloc.lastName,
                name: _bloc.name,
                pointsUser: _bloc.points),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: SeeMore(),
              padding: const EdgeInsets.only(top: 20),
            ),
            Card(
              child: CouponView(),
              color: secondary,
            )
          ]),
        )
      ]);
    }
  }
}
