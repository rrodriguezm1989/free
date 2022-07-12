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
  int counter = 0;

  ReadProductFakeRepositoryImpl(ProductReaderView productView) : super(productView);

  @override
  Future readProduct(int milliseconds) async {

    Future.delayed(
        Duration(milliseconds: milliseconds),
        () => view
            .updateProduct(couponList[counter])
    );
    counter++;
  }

  @override
  void setupQRReader() {
    // TODO: implement setupQRReader
  }
}
