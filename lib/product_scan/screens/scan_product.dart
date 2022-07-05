import 'package:dandy/common/constants/components/app_bar_main.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/coupon/models/coupon_model.dart';
import 'package:dandy/product_scan/implementations/view_product_fake_impl.dart';
import 'package:dandy/product_scan/models/read_product_repository.dart';
import 'package:dandy/product_scan/widgets/scan_alert_factory.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ScanProductScreen extends StatefulWidget {
  const ScanProductScreen({Key? key}) : super(key: key);

  @override
  State<ScanProductScreen> createState() => _ScanProductScreenState();
}

class _ScanProductScreenState extends State<ScanProductScreen> {
  String? msg;
  AlertType? msgType;
  List<Coupon> list = [];
  late ValueNotifier<List<Coupon>> listener;
  bool? wasSuccessful;
  Coupon? currentProduct;
  late ProductReaderView view;

  @override
  void initState() {
    super.initState();
    view = ViewProductFakeImpl(
        (product) => setState(() {
          currentProduct = product;
          msgType = AlertType.COUNT_DOWN;
          msg =
              "${currentProduct!.product.title} +${currentProduct!.points}pts";
        })
    );
    view.setup();
  }

  @override
  Widget build(BuildContext context) {
    listener = ValueNotifier<List<Coupon>>(list);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: mainAppBar('LOGO', true),
      backgroundColor: secondary,
      body: Stack(children: [
        Column(children: [
          const Text(
            'Escanea tus productos y gana puntos',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18.0),
          ),
          const SizedBox(height: 43),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 35),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
            decoration: BoxDecoration(
                color: const Color(0xAA29262B),
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: DottedBorder(
                strokeWidth: 2,
                color: Colors.white,
                radius: const Radius.circular(15),
                padding: const EdgeInsets.all(10),
                child: view.getWidget(size),
              ),
            ),
          ),
          Expanded(
            child: Container(),
          ),
          if (currentProduct != null) showProduct(),
          const SizedBox(height: 25),
        ]),
        if (msg != null && msgType != null)
          showAlert(size.width * .95, msg!, msgType!)
      ]),
    );
  }

  void onCameraRejected() {
    setState(() {
      msg = "Freebie necesita acceder a tu cámara";
      msgType = AlertType.TEXT;
    });
  }

  void onScanFailed() {
    setState(() {
      msg = "Escaneo fallido, pruebe de nuevo";
      msgType = AlertType.TEXT;
    });
  }

  Widget showAlert(double width, String msg, AlertType alertType) {
    return alertType == AlertType.TEXT
        ? ScanAlertFactory.showAlert(width, msg, alertType)
        : ScanAlertFactory.showAlert(
            width, msg, alertType, list.length.toString(), () {
            if (list.isEmpty) return;
            list.remove(list.last);
            setState(() {});
          }, () {
            list.add(currentProduct!);
            setState(() {});
          });
  }

  Widget showProduct() {
    return Row(
      children: [
        const SizedBox(width: 38),
        RotatedBox(
            quarterTurns: 2,
            child: TextButton(
              onPressed: () {
                currentProduct = null;
                msg = null;
                msgType = null;
                setState(() {});
              },
              child: const Icon(
                Icons.double_arrow,
                color: Colors.white,
              ),
            )),
        const SizedBox(width: 10.21),
        TextButton(
          onPressed: () {
            view.shutdown();
            Navigator.of(context)
                .pushNamed('/scan/1', arguments: currentProduct);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(currentProduct!.product.title,
                  style: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.w600,
                      fontSize: 12)),
              Text("${currentProduct!.points} pts",
                  style: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.w400,
                      fontSize: 12)),
            ],
          ),
        ),
        Expanded(child: Container()),
        if (list.isNotEmpty)
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Row(
              children: [
                Text(
                  'Finalizar',
                  style: TextStyle(
                      color: greyText,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                Icon(
                  Icons.check,
                  color: greyText,
                )
              ],
            ),
          )
      ],
    );
  }
}