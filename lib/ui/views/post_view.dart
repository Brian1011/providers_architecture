import 'package:flutter/material.dart';
import 'package:providers_architecture/core/models/post.dart';
import 'package:providers_architecture/ui/shared/app_colors.dart';

import '../shared/ui_helpers.dart';
import '../widgets/comments.dart';

class PostView extends StatelessWidget {
  final Post post;
  const PostView({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(
              post.title,
              style: const TextStyle(fontSize: 26),
            ),
            Text('by ${post.userId}'),
            UIHelper.verticalSpaceMedium(),
            Comments(post.id),
          ],
        ),
      ),
    );
  }
}
