import 'package:providers_architecture/core/services/api.dart';
import 'package:providers_architecture/core/viewmodels/base_model.dart';
import 'package:providers_architecture/locator.dart';

import '../enums/view_state.dart';
import '../models/comment.dart';

class CommentsModel extends BaseModel {
  final Api _api = locator<Api>();

  List<Comment> comments = [];

  Future fetchComments(int postId) async {
    setState(ViewState.busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.idle);
  }
}
