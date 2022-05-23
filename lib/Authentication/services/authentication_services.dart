import '../../common/constants/api.dart';

class AuthenticationServices {
  final _db = endpoint;

  bool loading = false;

  getLoading() {
    return loading;
  }

  Future<bool> signUp(username, password) async {
    loading = true;
    //here do request to sign up

    //insert token based on response

    //return
    loading = false;
    return true;
  }
}
