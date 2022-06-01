import 'dart:async';

import 'package:dandy/Authentication/bloc/authentication_event.dart';
import 'package:flutter/material.dart';

class AuthenticationBloC {
  // db service?

  /*String? token;
  String? decoded;
  bool isAuthenticating = false;
  bool isRefreshing = false;
  String? authenticatingError;
  String? refreshingError;*/

  int _counter = 0;

  // init and get StreamController
  final _authenticationStreamController = StreamController<int>();
  StreamSink<int> get authentication_sink =>
      _authenticationStreamController.sink;

  // expose data from stream
  Stream<int> get stream_authentication =>
      _authenticationStreamController.stream;

  ValueNotifier<int> counter = ValueNotifier<int>(0);

  ValueNotifier<bool> loading = ValueNotifier(false);

  int count = 0;
  late StreamController<int> counterController;

  Stream<int> get counterStream => counterController.stream;

  final _authenticationEventController =
      StreamController<AuthenticationEvent>();
  // expose sink for input events
  Sink<AuthenticationEvent> get authentication_event_sink =>
      _authenticationEventController.sink;

  AuthenticationBloC() {
    //_authenticationEventController.stream.listen(_logIn);
    counterController = StreamController();
  }

  void increaseCounter() {
    counterController.sink.add(_counter++);
    counter.value++;
  }

  _logIn(AuthenticationEvent event) => authentication_sink.add(++_counter);

  dispose() {
    _authenticationStreamController.close();
    _authenticationEventController.close();
  }
}
