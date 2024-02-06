import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_architecture/core/models/user.dart';
import 'package:providers_architecture/ui/router.dart';

import 'core/services/authentication_service.dart';
import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>(
        create: (context) =>
            locator<AuthenticationService>().userController.stream,
        initialData: User.initial(),
        builder: (context, snapshot) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(),
            initialRoute: '/login',
            onGenerateRoute: CustomRouter.generateRoute,
          );
        });
  }
}
