import 'dart:math';

import 'package:dandy/coupon/models/coupon_model.dart';
import 'package:dandy/coupon/utils/mock_coupon.dart';
import 'package:flutter/material.dart';

abstract class ProductReaderView {
  void setup();
  updateProduct(Coupon product);
  void shutdown();
  Widget getWidget(Size size);
}

abstract class ReadProductRepository {
  final ProductReaderView view;

  ReadProductRepository(this.view);

  void setupQRReader();

  Future readProduct(int seconds);
}

class ReadProductFakeRepositoryImpl extends ReadProductRepository {

  ReadProductFakeRepositoryImpl(ProductReaderView productView) : super(productView);

  @override
  Future readProduct(int seconds) async {
    Future.delayed(
        Duration(seconds: seconds),
        () => view
            .updateProduct(couponList[Random().nextInt(couponList.length)])
    );
  }

  @override
  void setupQRReader() {
    // TODO: implement setupQRReader
  }
}
