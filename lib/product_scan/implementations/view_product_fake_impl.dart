import 'package:dandy/coupon/models/coupon_model.dart';
import 'package:dandy/product_scan/models/read_product_repository.dart';
import 'package:dandy/product_scan/widgets/video_player_widget.dart';
import 'package:flutter/material.dart';

class ViewProductFakeImpl extends ProductReaderView {
  final Function(Coupon product) update;
  int readerCounter = 0;

  ViewProductFakeImpl(this.update);

  late ReadProductRepository repository;

  @override
  void setup() {
    repository = ReadProductFakeRepositoryImpl(this);
    repository.setupQRReader();
    repository.readProduct(4);
  }

  @override
  updateProduct(Coupon product) {
    if (readerCounter == -1) return;
    update(product);
    readerCounter++;
    checkoutCounter();
  }

  void checkoutCounter() {
    if (readerCounter == 1) {
      repository.readProduct(10);
    } else if (readerCounter == 2) {
      repository.readProduct(5);
    }
  }

  @override
  void shutdown() {
    readerCounter = -1;
  }

  @override
  Widget getWidget(Size size) {
    return AssetPlayerWidget(height: size.height * .6);
  }
}
