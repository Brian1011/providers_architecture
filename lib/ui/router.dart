import 'package:flutter/material.dart';
import 'package:providers_architecture/ui/views/home_view.dart';
import 'package:providers_architecture/ui/views/login_view.dart';
import 'package:providers_architecture/ui/views/post_view.dart';

import '../core/models/post.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/post':
        var post = settings.arguments as Post;
        return MaterialPageRoute(builder: (_) => PostView(post: post));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
