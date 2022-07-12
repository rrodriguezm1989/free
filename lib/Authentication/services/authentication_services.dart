import '../../common/constants/api.dart';

class AuthenticationServices {
  final _db = endpoint;

  bool loading = false;
  int _points = 13482;
  String name = "Roberto";
  String lastName = "Juarez";
  int get points => _points;

  getLoading() {
    return loading;
  }

  Future<bool> signUp(username, password) async {
    loading = true;
    //here do request to sign up

    //insert token based on response

    //Update coupon points here
    _points = 13482;

    //return
    loading = false;
    return true;
  }

  Future<bool> addPoints(int pts) async {
    _points += pts;
    return true;
  }

  Future<bool> redeemPoints(int pts) async {
    _points -= pts;
    return true;
  }
}
