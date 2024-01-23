import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/post_list_bloc.dart';
import 'widgets/single_post.dart';

class PostListView extends StatelessWidget {
  const PostListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostListBloc, PostListState>(
      builder: (context, state) {
        if (state.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (ctx, index) => SinglePost(
                  title: state.posts[index].title,
                  content: state.posts[index].content,
                  tags: state.posts[index].tags,
                ),
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 8,
                ),
            itemCount: state.posts.length);
      },
    );
  }
}
