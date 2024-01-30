import 'package:flutter/cupertino.dart';
import 'package:providers_architecture/locator.dart';

import '../services/authentication_service.dart';

enum ViewState { idle, busy }

class LoginModel extends ChangeNotifier {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  Future<bool> login(String userIdText) async {
    setState(ViewState.busy);
    var userId = int.tryParse(userIdText);
    var success = await _authenticationService.login(userId);
    setState(ViewState.idle);
    return success;
  }
}
