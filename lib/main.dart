import 'package:flutter/material.dart';
import 'package:providers_architecture/ui/router.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      initialRoute: '/login',
      onGenerateRoute: CustomRouter.generateRoute,
    );
  }
}
