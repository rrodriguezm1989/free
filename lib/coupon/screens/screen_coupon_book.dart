import 'package:dandy/Authentication/services/authentication_services.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/coupon/models/model_coupon.dart';
import 'package:dandy/coupon/utils/mock_coupon.dart';
import 'package:dandy/coupon/widgets/coupon_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;

class CouponBook extends StatefulWidget {
  const CouponBook({Key? key}) : super(key: key);

  @override
  State<CouponBook> createState() => _CouponBookState();
}

class _CouponBookState extends State<CouponBook> {
  late int points;
  List<Coupon> couponsFiltered = couponList;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    points = Provider.of<AuthenticationServices>(context).points;

    final pts = ValueNotifier<int>(points);

    NumberFormat myFormat = NumberFormat.decimalPattern('es');

    final appBar = AppBar(
      backgroundColor: secondary,
      elevation: 0,
      title: ValueListenableBuilder(
        builder: (_, int vl, __) {
          final String vFormated = myFormat.format(vl);
          return Text(
            '$vFormated pts',
            style: TextStyle(fontSize: 15, color: principal),
          );
        },
        valueListenable: pts,
      ),
    );

    return Scaffold(
      backgroundColor: secondary,
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: Text(
              'Redime tus puntos',
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 24 / 375,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const SizedBox(height: 20),
          _CouponFilterList(
            filters: filters,
            onClick: onClick,
          ),
          const SizedBox(height: 20),
          Expanded(
            child: CouponList(
              coupons: couponsFiltered,
              points: pts,
            ),
          )
        ],
      ),
    );
  }

  onClick(anchor) => setState(() {
        couponsFiltered = anchor == null
            ? couponList
            : couponList.where((f) => f.product.category == anchor).toList();
      });
}

class _CouponFilterList extends StatelessWidget {
  final List<CouponFilter> filters;

  final Function(String?) onClick;

  const _CouponFilterList(
      {Key? key, required this.filters, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          for (var filter in filters)
            _CouponFilterView(
                filter: filter,
                onClick: (anchor) {
                  for (var f in filters) {
                    if (f.selected && f.anchor != anchor) {
                      f.selected = false;
                    }
                  }
                  onClick(anchor);
                }),
          const SizedBox(width: 10)
        ],
      ),
    );
  }
}

class _CouponFilterView extends StatefulWidget {
  final CouponFilter filter;
  final Function(String?) onClick;

  const _CouponFilterView(
      {Key? key, required this.filter, required this.onClick})
      : super(key: key);

  @override
  State<_CouponFilterView> createState() => _CouponFilterViewState();
}

class _CouponFilterViewState extends State<_CouponFilterView> {
  @override
  Widget build(BuildContext context) {
    final style = TextButton.styleFrom(
      minimumSize: const Size(110, 25),
    );
    return TextButton(
        style: style,
        onPressed: onPressed,
        child: widget.filter.selected
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: label(constantColors.secondary),
                decoration: BoxDecoration(
                    color: constantColors.principal,
                    borderRadius: BorderRadius.circular(20)),
              )
            : label(Colors.white));
  }

  Text label(Color color) {
    return Text(
      widget.filter.title,
      style: TextStyle(color: color, fontSize: 16),
      textAlign: TextAlign.center,
    );
  }

  onPressed() {
    setState(() {
      widget.filter.selected = !widget.filter.selected;
      widget.onClick(widget.filter.selected ? widget.filter.anchor : null);
    });
  }
}
