import '../../locator.dart';
import 'api.dart';

class AuthenticationService {
  // inject api
  final Api _api = locator<Api>();

  Future<bool> login(int? userId) async {
    var fetchedUser = await _api.getUserProfile(userId);
    var hasUser = fetchedUser != null;
    return hasUser;
  }
}
