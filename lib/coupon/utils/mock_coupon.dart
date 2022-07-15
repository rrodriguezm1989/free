import 'dart:math';

import 'package:dandy/common/model/product_model.dart';
import 'package:dandy/coupon/models/coupon_model.dart';
import 'package:dandy/coupon/models/filter_model.dart';

final filters = [
  CouponFilter(title: 'Snacks', anchor: 'snack'),
  CouponFilter(title: 'Belleza', anchor: 'beauty'),
  CouponFilter(title: 'Saludable', anchor: 'health'),
  CouponFilter(title: 'Tecnología', anchor: 'object'),
];

final couponList = getCouponList();

List<Coupon> getCouponList() {
  final rn = Random();
  final List<Coupon> list = [];
  for (var product in productList) {
    list.add(Coupon(
        product: product,
        code: '${rn.nextInt(999)}-${rn.nextInt(999)}-${rn.nextInt(999)}'));
  }
  return list;
}

final productList = [
  Product(
      title: 'Pizza',
      category: 'snack',
      code: '743-36-0157',
      image:
          'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description:
          "When your opponent fears you, then's the moment when you give the fear its own rein, give it the time to work on him. Let it become terror.The terrified man fights himself.Eventually, he attacks in desperation.That is the most dangerous moment, but the terrified man can be trusted usually to make a fatal mistake."),
  Product(
      title: 'Café con lala',
      category: 'snack',
      code: '743-36-0387',
      image:
          'https://dl.kraken.io/web/4116f1af5823549dbc28d15347dde00a/lala.jpg',
      description: "Café con leche lista para tomar"),
  Product(
      title: 'Coca Cola',
      category: 'snack',
      code: '743-36-0311',
      image:
          'https://dl.kraken.io/web/8c68fd4400204e313360e8ecee8e5157/coca.jpg',
      description: "bebida azucarada en lata"),
  Product(
      title: 'Pepsi Black',
      category: 'snack',
      code: '743-36-1829',
      image:
          'https://dl.kraken.io/web/8c60d1f14c20dbf6a1473ca5c362d030/pepsi.png',
      description: "Pepsi black, bebida azucara"),
  Product(
      title: 'Nesquik',
      category: 'snack',
      code: '743-36-1821',
      image:
          'https://dl.kraken.io/web/413ea1dd82a114fe1d6107ba74004d6a/nesquik.jpg',
      description: "Nesquik personal"),
  Product(
      title: 'Pasta Ina',
      category: 'snack',
      code: '743-36-1821',
      image:
          'https://dl.kraken.io/web/22b5f40942b1cba1d0576dc0813694da/pasta.jpg',
      description: "Fusilli pasta tonillo"),
  Product(
      title: 'Axe anarchy for her',
      category: 'snack',
      code: '743-18-0019',
      image:
          'https://dl.kraken.io/web/b58e2d4ba7ab962167462701cc1117ba/axe.png',
      description: "Axe deodorant body spray"),
  Product(
      title: 'Naú maní japones',
      category: 'snack',
      code: '743-18-0019',
      image:
          'https://dl.kraken.io/web/c883fcd63c1b0a7f6fb547d670d4768a/mania.png',
      description: "Maní japonés, producto  horneado"),
  Product(
      title: 'Pork Sausage Roll',
      category: 'beauty',
      code: '846-21-8667',
      image:
          'https://images.pexels.com/photos/3685530/pexels-photo-3685530.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description:
          "Before I do your bidding, manling, I must cleanse the way between us. You've put a water burden on me that I'm not sure I care to support. But we Fremen pay our debts"),
  Product(
      title: 'French Toast',
      category: 'object',
      code: '061-19-5419',
      image:
          'https://images.pexels.com/photos/279906/pexels-photo-279906.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description:
          "On Caladan, we ruled with sea and air power. Here, we must scrabble for desert power. This is your inheritance, Paul."),
  Product(
      title: 'Salmon Nigiri',
      category: 'object',
      code: '458-20-8876',
      image:
          'https://images.pexels.com/photos/2783873/pexels-photo-2783873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "To save one from a mistake is a gift of paradise."),
  Product(
      title: 'Shakespeare Oatmeal',
      category: 'health',
      code: '702-87-8029',
      image:
          'https://images.pexels.com/photos/3259600/pexels-photo-3259600.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description:
          "Growth is limited by that necessity which is present in the least amount. And, naturally, the least favorable condition controls the growth rate."),
  Product(
      title: 'Samuel Smith’s Oatmeal Stout',
      category: 'health',
      code: '166-61-4231',
      image:
          'https://images.pexels.com/photos/2622187/pexels-photo-2622187.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description:
          "On Caladan, we ruled with sea and air power. Here, we must scrabble for desert power. This is your inheritance, Paul."),
  Product(
      title: 'Chimay Grande Réserve',
      category: 'object',
      code: '034-99-5107',
      image:
          'https://images.pexels.com/photos/1470167/pexels-photo-1470167.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "They tried and died."),
  Product(
      title: 'Stone IPA',
      category: 'beauty',
      code: '450-91-5801',
      image:
          'https://images.pexels.com/photos/2693644/pexels-photo-2693644.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "If wishes were fishes, we'd all cast nets."),
  Product(
      title: 'Oak Aged Yeti Imperial Stout',
      category: 'object',
      code: '470-54-5672',
      image:
          'https://images.pexels.com/photos/341523/pexels-photo-341523.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "He who controls the spice, controls the universe!"),
  Product(
      title: 'Yeti Imperial Stout',
      category: 'snack',
      code: '520-06-1730',
      image:
          'https://images.pexels.com/photos/205961/pexels-photo-205961.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "Bring in that floating fat man, the Baron!"),
  Product(
      title: '90 Minute IPA',
      category: 'health',
      code: '690-03-9714',
      image:
          'https://images.pexels.com/photos/255501/pexels-photo-255501.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "Usul has called a big one. Again, it is the legend."),
  Product(
      title: 'Sapporo Premium',
      category: 'object',
      code: '087-96-7590',
      image:
          'https://images.pexels.com/photos/1279107/pexels-photo-1279107.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description:
          "To attempt an understanding of Muad'Dib without understanding his mortal enemies, the Harkonnens, is to attempt seeing Truth without knowing Falsehood. It is the attempt to see the Light without knowing Darkness. It cannot be."),
  Product(
    title: 'Ten FIDY',
    category: 'beauty',
    code: '049-40-6603',
    image:
        'https://images.pexels.com/photos/2533266/pexels-photo-2533266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    description:
        "No more terrible disaster could befall your people than for them to fall into the hands of a Hero.",
  ),
];
