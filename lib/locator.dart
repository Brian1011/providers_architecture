import 'package:get_it/get_it.dart';
import 'package:providers_architecture/core/services/api.dart';
import 'package:providers_architecture/core/services/authentication_service.dart';
import 'package:providers_architecture/core/viewmodels/comments_model.dart';
import 'package:providers_architecture/core/viewmodels/home_model.dart';
import 'package:providers_architecture/core/viewmodels/login_model.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => LoginModel());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}
