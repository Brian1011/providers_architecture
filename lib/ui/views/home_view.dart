import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers_architecture/core/viewmodels/home_model.dart';
import 'package:providers_architecture/ui/shared/app_colors.dart';
import 'package:providers_architecture/ui/shared/text_styles.dart';
import 'package:providers_architecture/ui/shared/ui_helpers.dart';
import 'package:providers_architecture/ui/views/base_view.dart';
import 'package:providers_architecture/ui/widgets/postlist_item.dart';

import '../../core/enums/view_state.dart';
import '../../core/models/post.dart';
import '../../core/models/user.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
        onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
        builder: (context, model, child) => Scaffold(
              backgroundColor: backgroundColor,
              body: model.state == ViewState.busy
                  ? const Center(child: CircularProgressIndicator())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UIHelper.verticalSpaceLarge(),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(
                              'Welcome ${Provider.of<User>(context).name}',
                              style: subHeaderStyle),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text('Here are all your posts',
                              style: subHeaderStyle),
                        ),
                        UIHelper.verticalSpaceSmall(),
                        Expanded(
                          child: getPostsUi(model.posts),
                        )
                      ],
                    ),
            ));
  }
}

Widget getPostsUi(List<Post> posts) => ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) => PostListItem(
          post: posts[index],
          onTap: () {
            Navigator.pushNamed(context, '/post', arguments: posts[index]);
          },
        ));
