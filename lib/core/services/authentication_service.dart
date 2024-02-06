import 'dart:async';

import '../../locator.dart';
import '../models/user.dart';
import 'api.dart';

class AuthenticationService {
  // inject api
  final Api _api = locator<Api>();

  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int? userId) async {
    var fetchedUser = await _api.getUserProfile(userId);
    var hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(fetchedUser!);
    }
    return hasUser;
  }
}
