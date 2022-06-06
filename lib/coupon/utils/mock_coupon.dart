import 'package:dandy/coupon/models/coupon_model.dart';
import 'package:dandy/coupon/models/filter_model.dart';

final filters = [
  CouponFilter(title: 'Snacks', anchor: 'snack'),
  CouponFilter(title: 'Belleza', anchor: 'beauty'),
  CouponFilter(title: 'Saludable', anchor: 'health'),
  CouponFilter(title: 'Tecnología', anchor: 'object'),
];

final couponList = [
  Coupon(
      title: 'Pizza',
      category: 'snack',
      code: '743-36-0157',
      image:
          'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: '497838731724889'),
  Coupon(
      title: 'Pork Sausage Roll',
      category: 'beauty',
      code: '846-21-8667',
      image:
          'https://images.pexels.com/photos/3685530/pexels-photo-3685530.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "Before I do your bidding, manling, I must cleanse the way between us. You've put a water burden on me that I'm not sure I care to support. But we Fremen pay our debts"),
  Coupon(
      title: 'French Toast',
      category: 'object',
      code: '061-19-5419',
      image:
          'https://images.pexels.com/photos/279906/pexels-photo-279906.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "On Caladan, we ruled with sea and air power. Here, we must scrabble for desert power. This is your inheritance, Paul."),
  Coupon(
      title: 'Salmon Nigiri',
      category: 'object',
      code: '458-20-8876',
      image:
          'https://images.pexels.com/photos/2783873/pexels-photo-2783873.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "To save one from a mistake is a gift of paradise."),
  Coupon(
      title: 'Shakespeare Oatmeal',
      category: 'health',
      code: '702-87-8029',
      image:
          'https://images.pexels.com/photos/3259600/pexels-photo-3259600.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "Growth is limited by that necessity which is present in the least amount. And, naturally, the least favorable condition controls the growth rate."),
  Coupon(
      title: 'Samuel Smith’s Oatmeal Stout',
      category: 'health',
      code: '166-61-4231',
      image:
          'https://images.pexels.com/photos/2622187/pexels-photo-2622187.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "On Caladan, we ruled with sea and air power. Here, we must scrabble for desert power. This is your inheritance, Paul."),
  Coupon(
      title: 'Chimay Grande Réserve',
      category: 'object',
      code: '034-99-5107',
      image:
          'https://images.pexels.com/photos/1470167/pexels-photo-1470167.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "They tried and died."),
  Coupon(
      title: 'Stone IPA',
      category: 'beauty',
      code: '450-91-5801',
      image:
          'https://images.pexels.com/photos/2693644/pexels-photo-2693644.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "If wishes were fishes, we'd all cast nets."),
  Coupon(
      title: 'Oak Aged Yeti Imperial Stout',
      category: 'object',
      code: '470-54-5672',
      image:
          'https://images.pexels.com/photos/341523/pexels-photo-341523.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "He who controls the spice, controls the universe!"),
  Coupon(
      title: 'Yeti Imperial Stout',
      category: 'snack',
      code: '520-06-1730',
      image:
          'https://images.pexels.com/photos/205961/pexels-photo-205961.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "Bring in that floating fat man, the Baron!"),
  Coupon(
      title: '90 Minute IPA',
      category: 'health',
      code: '690-03-9714',
      image:
          'https://images.pexels.com/photos/255501/pexels-photo-255501.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "Usul has called a big one. Again, it is the legend."),
  Coupon(
      title: 'Sapporo Premium',
      category: 'object',
      code: '087-96-7590',
      image:
          'https://images.pexels.com/photos/1279107/pexels-photo-1279107.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "To attempt an understanding of Muad'Dib without understanding his mortal enemies, the Harkonnens, is to attempt seeing Truth without knowing Falsehood. It is the attempt to see the Light without knowing Darkness. It cannot be."),
  Coupon(
      title: 'Ten FIDY',
      category: 'beauty',
      code: '049-40-6603',
      image:
          'https://images.pexels.com/photos/2533266/pexels-photo-2533266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      description: "No more terrible disaster could befall your people than for them to fall into the hands of a Hero.",
  ),
];
