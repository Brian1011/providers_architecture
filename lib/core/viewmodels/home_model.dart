import 'package:flutter/material.dart';
import 'package:providers_architecture/core/enums/view_state.dart';
import 'package:providers_architecture/core/services/api.dart';
import 'package:providers_architecture/core/viewmodels/base_model.dart';
import 'package:providers_architecture/locator.dart';

import '../models/post.dart';

class HomeModel extends BaseModel {
  final Api _api = locator<Api>();

  List<Post> posts = [];

  Future getPosts(int userId) async {
    setState(ViewState.busy);
    debugPrint('userId: $userId');
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.idle);
  }
}
