import 'dart:async';


class AuthenticationBloc {
  StreamController<String> streamController = StreamController.broadcast();

  // db service?

  String? token;
  String? decoded;
  bool isAuthenticating = false;
  bool isRefreshing = false;
  String? authenticatingError;
  String? refreshingError;

  // Stream sign up
  // Stream log in
  //Stream refresh token
  //Stream

  Stream<String> streamToken() {
    return streamController.stream;
  }
}