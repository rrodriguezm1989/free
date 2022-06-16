import 'package:dandy/Authentication/components/background.dart';
import 'package:dandy/Profile/Coupon_view.dart';
import 'package:dandy/Profile/Product_profile.dart';
import 'package:dandy/Profile/points_description.dart';
import 'package:dandy/Profile/profile_appbar.dart';
import 'package:dandy/Profile/review_list.dart';
import 'package:dandy/Profile/see_more.dart';
import 'package:dandy/common/constants/components/typical_input.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/coupon/models/description_args.dart';
import 'package:dandy/coupon/screens/screen_coupon_book.dart';
import 'package:dandy/coupon/screens/screen_coupon_congrats.dart';
import 'package:dandy/coupon/screens/screen_coupon_description.dart';
import 'package:dandy/coupon/widgets/coupon_card.dart';
import 'package:dandy/coupon/widgets/coupon_list.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    Center ; {
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
            return Expanded(child: Stack(
            children:  <Widget>[
            Container(
              color: secondary,
              child: ListView(
                children: <Widget>[
                PointsDescription(lastName:"LastName" , name:"Name", pointsUser: 13.482),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20
                    ),
                      child: SeeMore(),
                      padding: const EdgeInsets.only(
                        top: 20
                      ),

                  ),
                  CouponView()


              ]
              ) ,
            )
          ]
        ));

  }
 }
}