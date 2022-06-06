class Coupon {
  bool redeemed;
  String title;
  String category;
  String description;
  String image;
  String code;
  int points;

  Coupon({
    this.redeemed = false,
    required this.title,
    required this.category,
    required this.description,
    required this.image,
    required this.code,
    this.points = 30,
  });
}
