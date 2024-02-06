import 'package:flutter/material.dart';
import 'package:providers_architecture/core/viewmodels/comments_model.dart';

import '../../core/enums/view_state.dart';
import '../../core/models/comment.dart';
import '../shared/app_colors.dart';
import '../shared/ui_helpers.dart';
import '../views/base_view.dart';

class Comments extends StatelessWidget {
  final int postId;
  const Comments(this.postId, {super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
        builder: (BuildContext context, CommentsModel model, Widget child) {
      return model.state == ViewState.busy
          ? const Center(child: CircularProgressIndicator())
          : Expanded(
              child: ListView(
                children: model.comments
                    .map((comment) => CommentItem(comment))
                    .toList(),
              ),
            );
    }, onModelReady: (CommentsModel model) {
      model.fetchComments(postId);
    });
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: commentColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            comment.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment.body),
        ],
      ),
    );
  }
}
